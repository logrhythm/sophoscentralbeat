""" convert gosec json report file to be order by severity, rule_id, file
    stdin - the gosec output report file
    stdout - generated gosec report order by severity, rule_id, file
    stderr - write Gosec report file issue summary

    Original file in https://github.com/logrhythm repo 'siem' direcory 'cmd/veracode'
    Copied file in https://github.com/logrhythm repo 'pubsubbeat' directory 'cmd'
    Copied file in https://github.com/logrhythm repo 'sophoscentralbeat' directory 'cmd'
"""

import json
import sys


def ignore_unused(var):
    """ avoids pylint unused variable """
    tmp_a = var
    var = tmp_a


def file_info(f_issue):
    """ returns file info dictionary """
    rulefile = {}
    rulefile["code"] = f_issue["code"]
    rulefile["line"] = f_issue["line"]
    rulefile["column"] = f_issue["column"]
    return rulefile


def rule_id_info(r_issue):
    """ returns rule_id info dictionary """
    issue = {}
    issue["confidence"] = r_issue["confidence"]
    issue["details"] = r_issue["details"]
    issue["cwe"] = r_issue["cwe"]
    issue["filelist"] = {}
    r_name = r_issue["file"]
    issue["filelist"][r_name] = []
    issue["filelist"][r_name].append(file_info(r_issue))
    return issue


if __name__ == "__main__":

    stdin_fileno = sys.stdin
    stdout_fileno = sys.stdout
    stderr_fileno = sys.stderr

    input_data = json.load(stdin_fileno)

    input_issues = input_data["Issues"]
    count = 0
    severity_dic = {}
    for in_issue in input_issues:
        count += 1
        stderr_fileno.write("count {} JSON: {}\n".format(count, json.dumps(in_issue)))

        severity = in_issue["severity"]
        rule_id = in_issue["rule_id"]
        if severity in severity_dic:
            # Search for "rule_id" in severity dictionary
            if rule_id in severity_dic[severity]:
                # Add file info to "rule_id" dictionary
                filename = in_issue["file"]
                if filename in severity_dic[severity][rule_id]["filelist"]:
                    # file already in rule, so just add file info
                    severity_dic[severity][rule_id]["filelist"][filename].append(file_info(in_issue))
                else:
                    # add file init info to "rule_id" dictionary
                    severity_dic[severity][rule_id]["filelist"][filename] = []
                    severity_dic[severity][rule_id]["filelist"][filename].append(file_info(in_issue))
            else:
                # Create init "rule_id" dictionary Add "rule_id" dictionary to severity dictionary
                severity_dic[severity][rule_id] = rule_id_info(in_issue)
        else:
            # Create init "severity" dictionary with init "rule_id" dictionary
            severity_dic[severity] = {}
            severity_dic[severity][rule_id] = rule_id_info(in_issue)

    output_issues = {}
    for severity in severity_dic:
        output_issues[severity] = json.loads(json.dumps(severity_dic[severity], sort_keys=True))

    json.dump(output_issues, stdout_fileno, indent=4)
    print()
