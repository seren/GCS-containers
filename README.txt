Build a base install:
Run the build.sh script and follow the prompts.
This is what would be uploaded to a public registry.

Build the configured GCS install:
Create an assets/vars.conf file from the example. Run the build.sh script and follow the prompts. To run, execute run.sh.
This should remain local since it may contain sensitive info (unless a volume is used to store those changes)


Need to open ports

# inbound ports:
# 2811 control channel (from 184.73.189.163 and 174.129.226.69)
# 50000-51000 data channel
# 7512 optional myproxy (from 174.129.226.69)
# 443 optional oauth
---------------

docker image flow:
ubuntu -> ubuntu-with-unconfigured-gcs-installed -> configured gcs