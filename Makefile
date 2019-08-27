cleanup-dc1:
	docker-compose -f ./docker-compose-dc1.yml rm -s -v -f

cleanup-dc2:
	docker-compose -f ./docker-compose-dc2.yml rm -s -v -f

cleanup-watchers:
	docker-compose -f ./docker-compose-watchers.yml rm -s -v -f

cleanup: cleanup-watchers cleanup-dc2 cleanup-dc1

run-dc1: cleanup-dc1
	docker-compose -f ./docker-compose-dc1.yml up -d --renew-anon-volumes --force-recreate

run-dc2: cleanup-dc2
	docker-compose -f ./docker-compose-dc2.yml up -d --renew-anon-volumes --force-recreate

run-watchers:
	docker-compose -f ./docker-compose-watchers.yml up -d --renew-anon-volumes --force-recreate

run: run-dc1 run-dc2 run-watchers

pause-dc2:
	docker-compose -f ./docker-compose-dc2.yml pause

unpause-dc2:
	docker-compose -f ./docker-compose-dc2.yml unpause

logs-dc1:
	docker-compose -f ./docker-compose-dc1.yml logs --follow

logs-dc2:
	docker-compose -f ./docker-compose-dc2.yml logs --follow

logs-watchers:
	docker-compose -f ./docker-compose-watchers.yml logs --follow

logs-watchers:
	docker-compose -f ./docker-compose-watchers.yml logs --follow

status:
	docker-compose -f ./docker-compose-dc1.yml ps
	docker-compose -f ./docker-compose-dc2.yml ps
	docker-compose -f ./docker-compose-watchers.yml ps

db-status-dc1:
	docker-compose -f ./docker-compose-dc1.yml exec db-node1 nodetool status

db-status-dc2:
	docker-compose -f ./docker-compose-dc2.yml exec db-node1 nodetool status

db-status: db-status-dc1
