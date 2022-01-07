
echo "Creating namespace"
oc new-project fiap-6aso-grupo32

echo "Accessing namespace"
oc project fiap-6aso-grupo32

echo "Deploy blog app"
oc apply -f https://raw.githubusercontent.com/pessaicow/openshift/main/blog-django-py-git.yml

sleep 10

echo "Deploy HPA autoscale"
oc apply -f https://raw.githubusercontent.com/pessaicow/openshift/main/hpa-scale.yml

sleep 10

echo "Deploy DB"
oc apply -f https://raw.githubusercontent.com/pessaicow/openshift/main/deploy-db.yml

sleep 10

echo "Connect with DB"
oc set env deployment/blog-django-py-git DATABASE_URL=postgresql://sampledb:sampledb@sample-database:5432/sampledb

echo "Set environment vars"
oc set env deployment/blog-django-py-git BLOG_SITE_NAME='FIAP 6ASO Grupo32 RM341691'
oc set env deployment/blog-django-py-git BLOG_BANNER_COLOR=blue

echo "Done! Obrigado! Thiago Soares RM341691 6ASO Grupo32"