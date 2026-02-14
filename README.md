# ci-tools
Scripts and tools helpful to have on ci hosts

## Slack Messages

1. Setup a workflow in Slack that starts with a webhook and then sends a message to a channel

2. Create secrets file at `/etc/slack/secrets.env` with the content
    ```bash
    SLACK_WEBHOOK_URL=https://hooks.slack.com/services/xxx/yyy/zzz
    ```

3. Restrict so only root can read it
    ```bash
    sudo chown root:root /etc/slack/secrets.env
    sudo chmod 600 /etc/slack/secrets.env
    ```

4. Clone this repo onto ci host

5. Setup cron job to run slack script
    ```bash
    * * * * * /home/stc/ci-tools/slack.sh
    ```
