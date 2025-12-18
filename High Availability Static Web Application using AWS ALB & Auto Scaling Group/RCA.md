# Root Cause Analysis (RCA)


## Issue: Auto Scaling Not Triggering Initially
**Root Cause:**
Application Load Balancer was associated with a default security group that did not allow inbound HTTP traffic, preventing proper routing to EC2 instances.


**Resolution:**
- Modified ALB security group to allow inbound HTTP (port 80)
- Updated EC2 instance security group to allow traffic from ALB security group
- Verified healthy targets in target group


---


## Validation: Successful Auto Scaling Event
**Test Performed:**
- CPU stressed to 100% for 15 minutes using stress utility
- CloudWatch alarm configured with target average CPU utilization of 30%


**Result:**
- Auto Scaling Group launched additional EC2 instances on first attempt
- New instances registered as healthy in ALB target group
- Load distributed successfully across instances
```md
# Root Cause Analysis (RCA)


## Issue 1: Static Assets Returning 404 Errors
**Root Cause:**
Incorrect document root permissions and missing files during boot-time deployment.


**Resolution:**
- Fixed Apache ownership (`apache:apache`)
- Corrected deployment path
- Restarted httpd service


---


## Issue 2: ALB Targets Flapping Between Healthy and Unhealthy
**Root Cause:**
Aggressive ALB health check interval combined with slow instance bootstrapping.


**Resolution:**
- Increased health check interval to 30 seconds
- Ensured Apache started before health check evaluation


---


## Issue 3: EFS Mount Timeout
**Root Cause:**
Missing NFS (2049) security group rule between EC2 and EFS.


**Resolution:**
- Added SG-to-SG inbound rule for port 2049
- Validated mount targets per AZ
