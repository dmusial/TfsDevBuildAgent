# Usage example

## Build agent
$ vagrant --tfs-url="http://tools-dev0:8080/tfs" --username="dmusial" --password="xxxx" --agent-pool="dev-agents-linux" --agent-name="dmusial-dev-agent" up

## Destroy agent
$ vagrant --username="dmusial" --password="xxxx" destroy