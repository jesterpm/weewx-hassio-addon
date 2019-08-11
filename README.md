# WeeWX Hass.io Add-on

## About

This is a Hass.io add-on to run Weewx. This setup is rather specific toward my
particular use of Weewx and my be of limited value to others in its current
form.

## Configuration

```json
{
  "log_level": "info",
  "config_bucket": "",
  "aws_access_key_id": "",
  "aws_secret_access_key": ""
},
```

### Option: `log_level`

The `log_level` option controls the level of log output by the addon and can
be changed to be more or less verbose, which might be useful when you are
dealing with an unknown issue. Possible values are:

- `trace`: Show every detail, like all called internal functions.
- `debug`: Shows detailed debug information.
- `info`: Normal (usually) interesting events.
- `warning`: Exceptional occurrences that are not errors.
- `error`:  Runtime errors that do not require immediate action.
- `fatal`: Something went terribly wrong. Add-on becomes unusable.

### Option: config_bucket

The `config_bucket` option dictates the S3 bucket to pull the weewx config,
skins and database backup from.

### Option: aws_access_key_id

The `aws_access_key_id` option specifies the AWS Access Key to use to retrieve
the config, etc. from the `config_bucket`.

### Option: aws_secret_access_key

The `aws_secret_access_Key` option specifies the AWS Secretr Key to use to
retrieve the config, etc. from the `config_bucket`.

