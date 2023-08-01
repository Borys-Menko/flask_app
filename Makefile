run: delete build 
	helm upgrade --install web-app helm/flask-app
	sleep 5
j_run:
	./jenkinsPolicy.sh
	sleep 5
	helm upgrade jenkins jenkins/jenkins -f helm/flask-app/jenkins-values.yaml
delete:
	helm delete web-app --wait
build: 
	docker build -t flask_app-web:v2 .
log:
	kubectl logs prod-env -c web 
desc:
	kubectl describe pod prod-env
exec:
	kubectl exec -it prod-env -- sh
forward:
	kubectl --namespace default port-forward svc/jenkins 8080:8080
j_delete:
	kubectl delete pod jenkins-0
j_log:
	kubectl logs jenkins-0 -c init