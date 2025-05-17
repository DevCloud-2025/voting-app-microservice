{{/*Generate common labels */}}
{{- define "demo-voting-app.labels" -}}
app: {{ .Release.Name }}
{{- end -}}
