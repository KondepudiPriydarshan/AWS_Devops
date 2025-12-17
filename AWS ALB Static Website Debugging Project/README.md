# AWS ALB Static Website Debugging Project

## Overview
Deployed a static website on EC2 instances behind an AWS Application Load Balancer (ALB).
Encountered intermittent asset loading issues which were diagnosed and resolved by
tuning ALB health checks and cleaning up frontend template inconsistencies.

## Architecture
User → ALB → Target Group → EC2 (Apache) → Static Website

## Technologies Used
- AWS EC2
- AWS Application Load Balancer
- Target Groups & Health Checks
- Apache / HTTPD
- Linux (Ubuntu / CentOS)
- Bash scripting
- HTML / CSS / JavaScript

## Problem Statement
Static website loaded inconsistently behind ALB.
Images and JS sometimes failed with 404 errors.

## Troubleshooting & Debugging
- Used browser DevTools (Network tab) to identify failing assets
- Compared direct instance access vs ALB access
- Analyzed ALB target health and health check behavior
- Reviewed Apache access and error logs

## Root Cause
- Overly aggressive ALB health-check interval caused target flapping
- Frontend template referenced unused Cloudflare and Tooplate assets

## Fixes Implemented
- Increased health-check interval from 6s to 30s
- Configured a lightweight health-check endpoint
- Removed unused CSS/JS references from HTML

## Outcome
- Stable website delivery via ALB
- No intermittent 404 errors
- Consistent behavior across refreshes

## How to Reproduce
1. Launch 2 EC2 instances
2. Install Apache
3. Deploy static website
4. Configure ALB with aggressive health checks
5. Observe intermittent failures
6. Apply fixes and validate stability

