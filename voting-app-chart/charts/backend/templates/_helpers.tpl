{{/* Generate common label for result app */}}
{{- define "demo-result-app.labels" -}}
app: {{ .Release.Name }}-results
{{- end -}}

{{/* Generate common label for worker app */}}
{{- define "demo-worker-app.labels" -}}
app: {{ .Release.Name }}-worker-app
{{- end -}}


{{/* Generate common label for redis app */}}
{{- define "redis.labels" -}}
app: {{ .Release.Name }}-redis
{{- end -}}

{{/* Generate common label for postgres app */}}
{{- define "postgres.labels" -}}
app: {{ .Release.Name }}-postgres
{{- end -}}
