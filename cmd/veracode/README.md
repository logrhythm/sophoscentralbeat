# Veracode and GoSec static security scans

* repo: sophoscentralbeat, veracode branch: sophos-VeraCode

## Veracode and GoSec files
* post_vendor.sh     - bash script: post restore 'vendor' directory after veracode and gosec generation
* prep_vendor.sh     - bash script: prepare 'vendor' directory for veracode and gosec generation
* sophos_go.mod      - copied from automatic generated sophos_go.mod via
* *                  - repo: siem, branch: us7476_veracode, directory: cmd/veracode/sophoscentralbeat 
* *                  - any change to this file, need to update above repo: siem 
* veracode.json      - veracode control json file for sophoscentralbeat
* veracode_zip.sh    - bash script: generates all component zip files and gosec report files
* *                  - Also includes Prepare and Post Restore scripts

## results directory      - gosec issue and result report files
* gosec_sophos_issues-2020_06_01.json - Release 2020.06 severity ordered issues
* gosec_sophos_result-2020_06_01.json - Release 2020.06 gosec generated results
* gosec_sophos_issues-2020_07_03.json - Release 2020.07 severity ordered issues
* gosec_sophos_result-2020_07_03.json - Release 2020.07 gosec generated results
* gosec_sophos_issues-2020_08_07.json - Release 2020.08 severity ordered issues
* gosec_sophos_result-2020_08_07.json - Release 2020.08 gosec generated results
* gosec_sophos_issues-2020_09_16.json - Release 2020.09 severity ordered issues
* gosec_sophos_result-2020_09_16.json - Release 2020.09 gosec generated results
* gosec_sophos_issues-2020_10_09.json - Release 2020.10 severity ordered issues
* gosec_sophos_result-2020_10_09.json - Release 2020.10 gosec generated results

## scripts directory      - python and shell scripts 
*                         - keep in sync with repo: siem, branch: us7476_veracode, directory: cmd/veracode/scripts
* __init__.py             - python module
* gosec_ruleid_count.sh   - bash script: counts each rule_id in gosec output json file
* gosec_severity_count.sh - bash script: counts each severity in gosec output json file
* gosec_rule_order.py     - python script: converts gosec output json into severity, rule, found-file order
* workspace_gomod.py      - bash script: generated go mod file via WORKSPACE file's go_repository items