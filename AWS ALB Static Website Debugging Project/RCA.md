## Incident
Intermittent static asset failures behind ALB.

## Impact
Website rendered incompletely for some users.

## Root Causes
- Aggressive ALB health-check interval
- Unused frontend asset references

## Resolution
- Tuned health-check interval
- Cleaned up HTML references

## Prevention
- Dedicated health-check endpoint
- Standardized deployment artifacts

