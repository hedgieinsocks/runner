
# 🖥️ Runner - Handy shell function to run local scripts on remote hosts

## Usage

```sh
# Modify the value for `${SCRIPTS_DIR}` variable in `runner.sh`

# Source `runner.sh` (or append the code to `~/.zshrc` for persistance)
➜  ~ source ./runner.sh

# Put your scripts into `${SCRIPTS_DIR}` directory
# This is an examplatory script just for the context
➜  ~ cat "${SCRIPTS_DIR}/suspend_user"
[[ -z "${1}" ]] && { echo "error: no user provided"; exit 1; }
id -u "${1}" && whmapi1 suspendacct disallowun=1 user="${1}"

# Press <TAB> after entering <HOSTNAME> to get suggestions from `${SCRIPTS_DIR}` contents
➜  ~ run 199.192.25.104
check_load get_users suspend_user

# Run your local script `${SCRIPTS_DIR}/suspend_user` on the remote server
➜  ~ run 199.192.25.104 suspend_user johndoe
4244
---
metadata:
  command: suspendacct
  output:
    raw: "Changing Shell to /bin/false...Done\nLocking Password...Done\nSuspending mysql users\nSuspending websites...\nSuspending FTP accounts...\nSuspending outgoing email....Done\njohndoe's account has been suspended\n"
  reason: OK
  result: 1
  version: 1

# Same but with custom SSH port
➜  ~ run 199.192.25.104:4327 suspend_user johndoe
4244
---
metadata:
  command: suspendacct
  output:
    raw: "Changing Shell to /bin/false...Done\nLocking Password...Done\nSuspending mysql users\nSuspending websites...\nSuspending FTP accounts...\nSuspending outgoing email....Done\njohndoe's account has been suspended\n"
  reason: OK
  result: 1
  version: 1
```
