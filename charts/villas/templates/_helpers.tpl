{{/*
Expand the name of the chart.
*/}}
{{- define "villas.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "villas.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "villas.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "villas.labels" -}}
helm.sh/chart: {{ include "villas.chart" . }}
{{ include "villas.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: villas-framework
{{- end }}

{{/*
Selector labels
*/}}
{{- define "villas.selectorLabels" -}}
app.kubernetes.io/name: {{ include "villas.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "villas.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "villas.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "villas.controller.namespace" -}}
{{- if .Values.controller.namespace -}}
{{ .Values.controller.namespace }}
{{- else -}}
{{ .Release.Namespace }}-controller
{{- end -}}
{{- end }}

{{/*
Get the broker password secret.
*/}}
{{- define "broker.secretName" -}}
    {{- if .Values.broker.auth.existingPasswordSecret -}}
        {{- printf "%s" (tpl .Values.broker.auth.existingPasswordSecret $) -}}
    {{- else -}}
        {{- printf "%s" (include "villas.fullname" .) -}}-broker
    {{- end -}}
{{- end -}}

{{/*
Get the database password secret.
*/}}
{{- define "database.secretName" -}}
{{- if .Values.global.postgresql.existingSecret }}
    {{- printf "%s" (tpl .Values.global.postgresql.existingSecret $) -}}
{{- else if .Values.database.existingSecret -}}
    {{- printf "%s" (tpl .Values.database.existingSecret $) -}}
{{- else -}}
    {{- printf "%s" (include "villas.fullname" .) -}}-database
{{- end -}}
{{- end -}}
