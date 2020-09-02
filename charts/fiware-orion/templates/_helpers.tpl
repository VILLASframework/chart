{{/* vim: set filetype=mustache: */}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "fiware-orion.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Expand the name of the chart.
*/}}
{{- define "fiware-orion.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "fiware-orion.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "fiware-orion.labels" -}}
helm.sh/chart: {{ include "fiware-orion.chart" . }}
{{ include "fiware-orion.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "fiware-orion.selectorLabels" -}}
app.kubernetes.io/name: {{ include "fiware-orion.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}


{{/*
Mongo Express
*/}}
{{- define "fiware-orion.mongoexpress.name" -}}
{{- include "fiware-orion.name" . -}}-mongoexpress
{{- end -}}

{{- define "fiware-orion.mongoexpress.fullname" -}}
{{- include "fiware-orion.fullname" . -}}-mongoexpress
{{- end -}}

{{- define "fiware-orion.mongoexpress.labels" -}}
{{ include "fiware-orion.labels" . }}
app.kubernetes.io/component: mongoexpress
{{- end -}}

{{- define "fiware-orion.mongoexpress.selectorLabels" -}}
app.kubernetes.io/name: {{ include "fiware-orion.mongoexpress.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/component: mongoexpress
{{- end -}}

{{/*
Broker
*/}}
{{- define "fiware-orion.broker.name" -}}
{{- include "fiware-orion.name" . -}}-broker
{{- end -}}

{{- define "fiware-orion.broker.fullname" -}}
{{- include "fiware-orion.fullname" . -}}-broker
{{- end -}}

{{- define "fiware-orion.broker.labels" -}}
{{ include "fiware-orion.labels" . }}
app.kubernetes.io/component: broker
{{- end -}}

{{- define "fiware-orion.broker.selectorLabels" -}}
app.kubernetes.io/name: {{ include "fiware-orion.broker.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/component: broker
{{- end -}}
