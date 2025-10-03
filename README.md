# Liquibase Secure - Snowflake Database Management

This repository contains Liquibase Secure configuration and workflows for managing Snowflake database changes with automated CI/CD pipelines.

## Overview

This project uses Liquibase Secure to track, version, and deploy database changes to Snowflake environments. It includes GitHub Actions workflows for automated builds, deployments, rollbacks, and policy checks.

## Project Structure

```
├── .github/workflows/     # GitHub Actions workflow definitions
├── changelogs/           # Database change definitions
│   ├── changelog.yaml    # Master changelog file
│   └── issues/          # Change scripts organized by issue
├── checks/              # Liquibase policy checks configuration
├── flows/               # Liquibase flow files for different operations
└── logs/                # Operation logs (ignored in git)
```

## Key Components

### Changelogs
- **changelog.yaml**: Master changelog that includes all database changes
- **issues/**: Directory containing SQL change scripts organized by ticket/issue
- Changes include initial tagging for rollback functionality

### Flow Files
The `flows/` directory contains Liquibase flow definitions:
- **liquibase-build.flowfile.yaml**: Validates and checks changes before deployment
- **liquibase-deploy.flowfile.yaml**: Deploys changes with drift detection and validation
- **liquibase-premerge.flowfile.yaml**: Pre-merge validation checks
- **liquibase-rollback.flowfile.yaml**: Rollback procedures
- **liquibase-snapshot.flowfile.yaml**: Creates database snapshots
- **liquibase-checks.flowfile.yaml**: Runs policy checks
- **liquibase-drift.flowfile.yaml**: Detects manual changes to environments

### GitHub Actions Workflows
Automated workflows for:
- **lbp_build_action.yml**: Build and validation
- **lbp_deploy_action.yml**: Deployment to environments
- **lbp_premerge_action.yml**: Pre-merge checks
- **lbp_rollback_action.yml**: Rollback deployments
- **lbp_snapshot_action.yml**: Create database snapshots
- **lbp_connect_with_secrets.yml**: Secure connection management

## Features

### Drift Detection
Automatically detects manual changes made to the database since the last deployment by comparing against stored snapshots.

### Policy Checks
Integrates Liquibase policy checks to enforce database standards and best practices.

### Rollback Support
Tags deployments to enable rollback to specific versions using labels.

### Snapshot Management
Stores database snapshots in AWS S3 for drift detection and environment cloning.

## Prerequisites

- Liquibase Pro license
- Snowflake account with appropriate credentials
- AWS S3 bucket for snapshot storage (for drift detection)
- GitHub repository with Actions enabled

## Usage

### Adding Database Changes

1. Create a new SQL file in `changelogs/issues/<ISSUE-ID>/`
2. Use Liquibase formatted SQL with changesets
3. Include appropriate labels for tracking (e.g., `jira-1234`)
4. Commit and push changes

Example changeset:
```sql
--liquibase formatted sql

--changeset author:changeset_id labels:jira-1234
CREATE TABLE CUSTOMERS (
  "ID" INT,
  "first_name" VARCHAR,
  "last_name" VARCHAR
);
--rollback DROP TABLE CUSTOMERS
```

### Running Workflows

Workflows are triggered automatically via GitHub Actions based on repository events (push, pull request, etc.).

### Environment Variables

Key environment variables used in flows:
- `ENVIRONMENT`: Target environment (e.g., dev, test, prod)
- `AWS_S3_BUCKET`: S3 bucket for snapshot storage
- `LB_TAG`: Tag name for deployments
- `LB_CHECK_DRIFT`: Enable/disable drift detection
- `LB_SCHEMAS`: Snowflake schemas to manage

## Reports

Liquibase generates HTML reports for:
- Deployment operations
- Drift detection
- Policy checks
- Database status

Reports are uploaded as workflow artifacts and can be accessed from the GitHub Actions UI.

## Configuration

- **liquibase.checks-settings.conf**: Policy checks configuration
- **.gitignore**: Excludes logs, reports, properties files, and temporary data

## Support

For Liquibase documentation, visit: https://docs.liquibase.com/
