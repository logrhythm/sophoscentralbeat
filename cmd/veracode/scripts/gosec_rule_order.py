""" convert gosec json report file to be order by severity, rule_id, file
    arg inputfile - the gosec output report file
    arg outputfile - generated gosec report order by severity, rule_id, file

    Original file in https://github.com/logrhythm repo 'siem' direcory 'cmd/veracode'
    Copied file in https://github.com/logrhythm repo 'pubsubbeat' directory 'cmd'
    Copied file in https://github.com/logrhythm repo 'sophoscentralbeat' directory 'cmd'
"""

import json
import sys
import getopt
import os.path


def main(command, argv):
    """ get input and output file args """
    inputfile = ''
    outputfile = ''
    try:
        opts, argc = getopt.getopt(argv, "hi:o:", ["ifile=", "ofile="])
        ignore_unused(argc)
    except getopt.GetoptError:
        print(command + '-i <inputfile> -o <outputfile>')
        sys.exit(2)
    for opt, arg in opts:
        if opt == '-h':
            print(command + '-i <inputfile> -o <outputfile>')
            sys.exit()
        elif opt in ("-i", "--ifile"):
            inputfile = arg
        elif opt in ("-o", "--ofile"):
            outputfile = arg
    print('Input file:  {}'.format(inputfile))
    print('Output file: {}'.format(outputfile))
    if (inputfile == '' or outputfile == ''):
        print(command + '-i <inputfile> -o <outputfile>')
        print("exit: inputfile or outputfile is empty")
        sys.exit(1)
    real_input = os.path.realpath(inputfile)
    if not os.path.isfile(real_input):
        print("exit: Not found input: {}".format(real_input))
        sys.exit(1)
    real_output = os.path.realpath(outputfile)
    if os.path.isfile(real_output):
        print("exit: Found output: {}".format(real_output))
        sys.exit(1)
    return real_input, real_output


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
    gosec_input, gosec_output = main(sys.argv[0], sys.argv[1:])

    with open(gosec_input) as f:
        input_data = json.load(f)

    input_issues = input_data["Issues"]
    count = 0
    severity_dic = {}
    for in_issue in input_issues:
        count += 1
        print("count {} JSON:".format(count), json.dumps(in_issue))

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

    with open(gosec_output, 'w') as json_file:
        json.dump(output_issues, json_file, indent=4)
