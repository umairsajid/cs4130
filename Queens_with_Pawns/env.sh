export X10_HOME=/opt/x10
echo "X10_HOME=${X10_HOME}"

if [ ! -e /usr/lib/jvm/java-6-openjdk-amd64 ]; then
    echo "ERROR: Cannot find required Java installation."
    echo "ERROR: You must log into clic-lab.cs.columbia.edu"
else
    export JAVA_HOME=/usr/lib/jvm/java-6-openjdk-amd64
    echo "JAVA_HOME=${JAVA_HOME}"
fi

