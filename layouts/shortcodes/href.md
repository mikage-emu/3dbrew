{{- $rootPath := "/" -}}
{{- $target := (.Get 0) -}}
{{- $targetExists := 0 -}}
{{- with .Get 1 -}}
{{- else -}}
{{- $target := relref . $target -}}
{{- $targetExists = 1 -}}
{{- end -}}
{{- $isExternal := (strings.HasPrefix $target "http") -}}
{{- if (not (or $isExternal (strings.HasPrefix $target "#"))) -}}
  {{- $style := "" -}}
  {{- $desiredPage := (index (strings.Split $target "#") 0) -}}
  {{- if (not $targetExists) -}}
    {{ $style = "color:#ba0000" }}
  {{- end -}}
  href="{{ $rootPath }}{{ strings.Replace $target ":" "" }}"
  style={{ $style }}{{ else }}href="{{ $target | safeURL }}"{{- if (strings.HasPrefix $target "http") }} target="_blank" rel="external" {{ end -}}{{ end -}}