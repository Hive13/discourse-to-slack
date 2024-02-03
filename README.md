# Hive13 discourse to Slack integration

A simple [Flask](https://flask.palletsprojects.com/en/2.0.x/) app with a simple route that takes the incoming message from the Discourse API and makes an http request to our Slack channel.

[Slack App Settings Page](https://api.slack.com/apps/A035EKE2KGB) -- This is where you find the Webhook URL

Currently, the all categories but leadership and wardens trigger the webhook. This can be adjusted in the webhook settings within dicourse. 

## To Run

### Clone The Repo

```shell
git clone https://git.thebasement.space/hhheath_/hive13-discourse-to-slack.git
```

### Install requirements

```shell
cd hive13-discourse-to-slack
```

```shell
pip install -r requirements.txt
```

Create a config.json file with slack endpoint details
```json
{
  "slack_url": "https://hooks.slack.com/services/<your-hook-url-path>"
}
```

### Run it

```shell
python3 src/main.py &
```

### Helpful commands

`ps aux | grep python` - find the PID of the running python script and kill it

`python3 src/main.py &` - run the python script so that when you exit the program or kill the ssh stream

## Build & run using Docker

```shell
docker build -t discourse-to-slack .
docker run -dit --name discourse-to-slack --restart unless-stopped -p42069:42069 discourse-to-slack
```

## Todo

- [ ] relative config file loading

## Example payload from Discourse

```json
{
  "post": {
    "id": 25862,
    "name": "heath",
    "username": "heath",
    "avatar_template": "/user_avatar/discoursetest.hive13.org/heath/{size}/1366_2.png",
    "created_at": "2022-03-03T06:33:26.005Z",
    "cooked": "<p>testing <img src=\"/images/emoji/twitter/slight_smile.png?v=10\" title=\":slight_smile:\" class=\"emoji\" alt=\":slight_smile:\"></p>",
    "post_number": 2,
    "post_type": 1,
    "updated_at": "2022-03-03T06:33:26.005Z",
    "reply_count": 0,
    "reply_to_post_number": null,
    "quote_count": 0,
    "incoming_link_count": 0,
    "reads": 0,
    "score": 0,
    "topic_id": 4946,
    "topic_slug": "testing-discourse-to-slack-integration",
    "topic_title": "Testing Discourse to Slack Integration",
    "category_id": 12,
    "display_username": "heath",
    "primary_group_name": null,
    "flair_name": null,
    "version": 1,
    "user_title": "Secretary",
    "title_is_group": false,
    "bookmarked": false,
    "raw": "testing :)",
    "moderator": true,
    "admin": true,
    "staff": true,
    "user_id": 8,
    "hidden": false,
    "trust_level": 4,
    "deleted_at": null,
    "user_deleted": false,
    "edit_reason": null,
    "wiki": false,
    "reviewable_id": null,
    "reviewable_score_count": 0,
    "reviewable_score_pending_count": 0,
    "topic_posts_count": 2,
    "topic_filtered_posts_count": 2,
    "topic_archetype": "regular",
    "category_slug": "hive13-infrastructure"
  }
}
```

