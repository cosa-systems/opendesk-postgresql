<!--
SPDX-FileCopyrightText: 2023 Bundesministerium des Innern und für Heimat, PG ZenDiS "Projektgruppe für Aufbau ZenDiS"

SPDX-License-Identifier: Apache-2.0
-->
{{ template "chart.header" . }}
{{ template "chart.description" . }}

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm repo add ${CI_PROJECT_NAME} ${CI_SERVER_PROTOCOL}://${CI_SERVER_HOST}/api/v4/projects/${CI_PROJECT_ID}/packages/helm/stable
helm install my-release ${CI_PROJECT_NAME}/{{ template "chart.name" . }}
```

{{ template "chart.requirementsSection" . }}

{{ template "chart.valuesSection" . }}

## Uninstalling the Chart

To install the release with name `my-release`:

```bash
helm uninstall my-release
```

## Signing

### Chart

Helm charts are signed with helm native signing method. You can verify the charts against this GPG key:

```
${GPG_SOUVAP_UNIVENTION_PUB}
```

### Images

Container images are signed via [cosign](https://github.com/sigstore/cosign) and can be verified with:

```
${COSIGN_PUBLIC_KEY}
```

```
cosign verify --key cosign.pub --insecure-ignore-tlog <image>
```

## License
This project uses the following license: Apache-2.0


## Copyright
Copyright (C) 2023 Bundesministerium des Innern und für Heimat, PG ZenDiS "Projektgruppe für Aufbau ZenDiS"
