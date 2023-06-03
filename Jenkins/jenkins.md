## Change Time Zone

Go to name > Configure

Select Singapore

## Reset build number to 1

Go to Manage Jenkins > Script Console

Run the script below. It will search for the job test-pipeline and delete build numbers from 1 to 200. Then it will update the next build number to 1.

```
def jobName = "test-pipeline"  
def job = Jenkins.instance.getItem(jobName)  
job.getBuilds().each { if(it.number >= 1 && it.number <= 200) it.delete() }
job.updateNextBuildNumber(1)
```
