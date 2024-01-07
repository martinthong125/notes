# Configuring Jenkins

1. Change Time Zone
   - Click on your name on the top right > Configure, look for User Defined Time Zone, and choose **Singapore**.
1. Enable Safe HTML
   - Go to Manage Jenkins > Security, look for Markup Formatter and choose **Safe HTML**.
1. Colorful Console output
   - Go to Manage Jenkins > Plugins, search for ansicolor and install the plugin
   - Go to Manage Jenkins > System, search for ANSI Color and under Global color map for all builds, key in **xterm**
1. Rebuild last build with same parameters
   - Go to Manage Jenkins > Plugins, search for **rebuilder** and install the plugin
1. Schedule a Build later
   - Go to Manage Jenkins > Plugins, search for **schedule build** and install the plugin
1. Install the Terraform plugin and install the latest version
   - Go to Manage Jenkins > Plugins, search for **terraform** and install the plugin
   - Go to Manage Jenkins > Tools, look for Terraform installations. Under Name, key in **Terraform-1.6.6** and tick install automatically. Choose the latest version. Eg. Terraform 1.6.6 linux (amd64)
1. Install the **Azure Credentials** plugin and save the service principal credentials
   - Go to Manage Jenkins > Plugins, search for azure and install the plugin
   - Go to Manage Jenkins > Credentials > System > Global credentials (unrestricted) and click on **+ Add Credentials**
   - For login to Azure, under Kind choose Azure Service Principal, fill in the **Subscription ID, Client ID, Client Secret and Tenant ID**. Under ID, key in **azure-sp**.
1. Save the ssh to github credentials
   - Go to Manage Jenkins > Credentials > System > Global credentials (unrestricted) and click on **+ Add Credentials**
   - For ssh to github, under Kind choose SSH Username with private-key. Please use ssh-keygen to create a new key-pair. Add the public key to github and the private key here.
   - Go to Manage Jenkins > Configure Security, look for Git Host Key Verification Configuration and choose **No verification**.

## Reset build number to 1

Go to Manage Jenkins > Script Console

Run the script below. It will search for the job test-pipeline and delete build numbers from 1 to 200. Then it will update the next build number to 1.

```
def jobName = "test-pipeline"
def newNum = 1
def job = Jenkins.instance.getItem(jobName)
job.getBuilds().each { if(it.number >= newNum && it.number <= 200) it.delete() }
job.updateNextBuildNumber(newNum)
```
