cd /opt/codes/selftics/

git checkout unimelb
git reset --hard && git pull

bash gradlew assemble

sudo systemctl stop stage1.selftics.com.service

rm -rf /home/virtual/stage1.selftics.com/tomcat/webapps/ROOT

cd /opt/codes/rgs-test/build/libs && unzip rgs-test-0.1.war -d /home/virtual/stage1.selftics.com/tomcat/webapps/ROOT

rm -f /home/virtual/stage1.selftics.com/tomcat/webapps/ROOT/WEB-INF/classes/application.yml
cp /opt/codes/stage1.selftics.com/application.yml /home/virtual/stage1.selftics.com/tomcat/webapps/ROOT/WEB-INF/classes/application.yml

sudo systemctl start stage1.selftics.com.service
sudo systemctl status stage1.selftics.com.service