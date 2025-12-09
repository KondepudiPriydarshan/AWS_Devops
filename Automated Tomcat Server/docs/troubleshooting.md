
---

## í°ž Troubleshooting Highlights
| Issue | Reason | Fix |
|-------|--------|------|
| systemd exit status 203 | Wrong ExecStart path or missing shebang | Updated paths, added `#!/bin/bash` |
| Permission denied | Bin scripts not executable | `chmod +x` |
| Tomcat not starting | Daemon not reloaded | `systemctl daemon-reload` |
| Wrong extraction directory | Incorrect tar location | Added `-C` option |

---

## í³ˆ Learning Outcomes
- Linux package management & permissions  
- Shell scripting automation  
- systemd service creation  
- Troubleshooting real DevOps issues  
- Working with tar, wget, users, groups  

---

## í´® Future Enhancements
- Convert script into an Ansible role  
- Add parameterized Tomcat version  
- Add input validation/error handling  
- Add logging for audit purposes  

---

## í³¬ Author
Priyadarshan Kondepudi  

