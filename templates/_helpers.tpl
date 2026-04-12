{{- /* Use dynamic chart name for helper template definitions and includes */ -}}
{{- $chartName := .Chart.Name -}}

{{- define (printf "%s.name" $chartName) -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define (printf "%s.fullname" $chartName) -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- printf "%s" $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{- define (printf "%s.labels" $chartName) -}}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
app.kubernetes.io/name: {{ include (printf "%s.name" $chartName) . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define (printf "%s.selectorLabels" $chartName) -}}
app.kubernetes.io/name: {{ include (printf "%s.name" $chartName) . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
