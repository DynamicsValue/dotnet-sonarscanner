# dotnet-sonarscanner

[`dotnet-sonarscanner`](https://docs.sonarqube.org/latest/analysis/scan/sonarscanner-for-msbuild/) GitHub Action.

_Currently does not support username/password authentication and presumes you are using tokens. Open to changing this, if required._

## Usage example

```yaml
- name: Sonarscanner for dotnet
  uses: Secbyte/dotnet-sonarscanner@v2.3
  with:
    restoreCommand: dotnet restore .
    buildCommand: dotnet build .
    testCommand: dotnet test .
    projectKey: a-project-key
    projectName: a-project-name
    sonarOrganisation: an-org
    beginArguments: >
        /d:sonar.verbose="true"
        /d:sonar.cs.opencover.reportsPaths='"/path/to/coverage.xml","/path/to/coverage.2.xml"'
        /d:sonar.coverage.exclusions='"**/*.cs","**/*.md"'
  env:
    SONAR_TOKEN: ${{ secrets.SONAR_TOKEN }}
    GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```

## Inputs

```yaml
restoreCommand:
  description: "Command to invoke to restore packages. Optional"
  required: false
buildCommand:
  description: "Command to invoke build"
  required: true
testCommand:
  description: "Command to invoke tests"
  required: false
projectKey:
  description: "Specifies the key of the analyzed project in SonarQube"
  required: true
projectName:
  description: "Specifies the name of the analyzed project in SonarQube"
  required: true
sonarHostname:
  description: "The server URL"
  default: "https://sonarcloud.io"
  required: false
sonarOrganisation:
  description: "Organisation"
  required: true
beginArguments:
  description: "Arguments to append to the begin command"
  required: false
endArguments:
  description: "Arguments to append to the end command"
  required: false
```

## Environment variables

* `SONAR_TOKEN` - Token from SonarCloud with ExecuteAnalysis permissions
* `GITHUB_TOKEN` - GitHub Token


#### Full dotnet docker images tags:

https://mcr.microsoft.com/v2/dotnet/sdk/tags/list