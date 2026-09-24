{{/*
SPDX-FileCopyrightText: 2026 Zentrum für Digitale Souveränität der Öffentlichen Verwaltung (ZenDiS) GmbH
SPDX-License-Identifier: Apache-2.0
*/}}
{{/*
Server wide max_connections: either the explicit override or the configured overhead plus the sum of all user
specific connection limits. Renders an empty string when neither is available, so the image default applies.
*/}}
{{- define "postgresql.maxConnections" -}}
{{- if .Values.postgres.maxConnections -}}
{{- .Values.postgres.maxConnections -}}
{{- else if .Values.job.users -}}
{{- $maxConnectionSum := .Values.postgres.maxConnectionsOverhead -}}
{{- range .Values.job.users -}}
{{- $maxConnectionSum = add $maxConnectionSum .connectionLimit -}}
{{- end -}}
{{- $maxConnectionSum -}}
{{- end -}}
{{- end -}}
