variable "project_id" {
  type        = string
  default     = "lacework-ecosystem1"
  description = "A project ID different from the default defined inside the provider"
}

variable "use_existing_service_account" {
  type        = bool
  default     = true
  description = "Set this to true to use an existing Service Account. When using an existing service account, the required roles must be added manually."
}

variable "service_account_name" {
  type        = string
  default     = "lw-cfg-ce968916"
  description = "The Service Account name (required when use_existing_service_account is set to true). This can also be used to specify the new service account name when use_existing_service_account is set to false"
}

variable "service_account_private_key" {
  type        = string
  default     = "ewogICJ0eXBlIjogInNlcnZpY2VfYWNjb3VudCIsCiAgInByb2plY3RfaWQiOiAibGFjZXdvcmstZWNvc3lzdGVtMSIsCiAgInByaXZhdGVfa2V5X2lkIjogImJiYWQ5MTY4Y2UzY2RiOTBhOGRiMDgwNjkwN2YxNTdiOTY0MjVkNzEiLAogICJwcml2YXRlX2tleSI6ICItLS0tLUJFR0lOIFBSSVZBVEUgS0VZLS0tLS1cbk1JSUV2QUlCQURBTkJna3Foa2lHOXcwQkFRRUZBQVNDQktZd2dnU2lBZ0VBQW9JQkFRQ09zcEM5ZFJZWUZZS3FcbjR6SDY3Z0Vpa0RaeWJmSXBVUVNSblY4djdkWUYrKzM0anJTRUJNbzZJb0dhcG5OSGZCbThWMDV6SzYxVHNzdVZcbmtvV09IcUpucTVwblhBZGZYa084ZWRBaVFjcmYzdXpxMkcydmtzYUhKOWpVYzljUndxNXViMU1RMnlVZFhTL1pcblkrSG5TSzZvQmxqdnE1OEI2Y2trSTFqVUZYdWR5U2VUVURxVHN5MDVSbWFiL0JwdUpINGw5a1F4WGtJNWFQRytcbldQeFl1MUt2cGdVZm02TnNnd1dkelUxZTJiYWMyYVpvUDYrRlRnVTYwK1IyaDk5OVFTRklBclhPaVhhZUI2MUJcbmd5TUdnbnJ2UmpMSHRES1NSQnlYNElrckl5bmxIL0pwSFZISEduelFTQzkwczF2SmZ1SnMxVzR6QlRFUjZGdWlcblJURlhCSGl6QWdNQkFBRUNnZ0VBQVpMbmpVMkJEdjh0dlE4ZXlVdGVQMTJ5TFBwVXdIcENaWGJlYUxmNmxVTjlcblhHMmY2bXR1WmlhdisvV2R5Rms3c3pKd2ZlUEJNdERHQktRUmlidjU4SFlTTHRWcm1iL0t3enBZZXJ6enZCcjFcbmtRcndLc05WaTFVL2gzS3dralpJTHJObCt1ZTdKclhnWjlDeU5LMm5tZGg0RTVZTk9mZ3M5SFZST2pMR09WR2dcbkU0ajIvRWF3TkZxRDlmS0MwN1JMa1BiWUNlc3ltOUJ2NDFpNWV2d0d6UytFVC9wRHEyRDdGLzJHS29yeExFdWNcbkNQOVI4eHlxNzhmVHNVVHZva25GZ3g0T21IeFdERFNTQVF2M0cxREJDUHAwdnNUU0RZek5tbE5UamEwY3d6VzJcbjlWY201SHk1MWVKSG5MWWxrdFN6TVZnMTd4cXViRHkyZXc1RkNiK0FBUUtCZ1FERXB2RUE0ZkFCTGlIZUF6NzBcbmhscUhCQllmN0FxRnV3a0ZLZVRWeDhpT3lpa0lXMjN6Nm5McmJQS0Q3YUNpaFJaUk1KSXJVMWhLMmJaeWNSUDNcblQ2ZkpwTkF1cG9yOWhPdSs4M2ZpYnAxalZZK2RYNlNENlIzNmhQNGlTR2NRQzdVN1MzZXNzYmdBeEJSZm5FVlFcbk5NeC84K1FoblhzMnFRU1JMK1RNaHN4dHhRS0JnUUM1d3l0LzFwWVZ6SzNzR1hKZnRFUTVSUVdlcXRqM1YvWnlcblBXZEdRS29oOTVWMDhnUVBnbXA2QTNnYlFIOURNanhoNjFLanFzaHJUYzJNZDJXV1NVU1VaKzdyMXNuK0VxNlFcbnBoaXlybkczMGZvT2VRRzVmT011NGVOOGg5VVNFWW9kTTFENm9NVVVINVFJTStQbkVXUkFWT2RqVTZlRlN2SXBcblhMR3hvL0hzRndLQmdFTWw1ZUV4Uk95Q1BobzY3WUk5WmlmNEl6M2ZNWENjZnVYK2VoN3RTdlJHMzEvMUtFUkRcblo5NHZvMWVkQ2w2MEp2eXVJeHNjS0dmV2swL2NnTDdQdWpGR1Q3ZStNbk9Dc2FUUUtiMXRtOXhSV09xWnYra3lcbjdvT2VhZEIyL0lva0ZVd2I1czlYRjhkYkxNSEE4SUlFcFZlRGhnQmNiN2dvV21EaEE3VTZ5ZzhwQW9HQUY5NTVcbkoyc0dTL1RKNEUyQXdjVmpBc3pZcFFPazcxdFJJbXE3YTI2QnJlMm5PYWlqVnU3V0NhbUtkRTM4VEVFWE95bkdcbnE1c1ZONXgrcmU3bGtjTUdXZDlrOXM3Wms1a0k3ek00ZHpVdERZYWdqOTJDbURmdzVTUkhXOGdFVzliL0hUTnJcbjAxaDNHbGZZYUpscVRsV1F3U2RudC82V3h1elRZdmN6S2ZVNzc2OENnWUJkbUVkS2o3d1U1L3puZk9oZzIxeHZcbitGWjhiV1ZKa29EbG40UmZWR1FIZG9yczcyUlpZVkxRTXhWV0I0TEZsd3h4RHdwdVp6ZitlYWFmQVFEYTR2NFdcbnI3ZFNnSk5Vdld3dy84V0YyN1JwK1NYV0ZIaTlrcHlxR0pQcHFFYnIrVm5iZHFJMHZ4WVh5d2daUDVFR2tQUWtcbnZISG5lSDFQdGpZd0RZOUNYbUUrQ0E9PVxuLS0tLS1FTkQgUFJJVkFURSBLRVktLS0tLVxuIiwKICAiY2xpZW50X2VtYWlsIjogImx3LWNmZy1jZTk2ODkxNkBsYWNld29yay1lY29zeXN0ZW0xLmlhbS5nc2VydmljZWFjY291bnQuY29tIiwKICAiY2xpZW50X2lkIjogIjEwMDQzNDg1NTA1OTY4MzYwODM5OSIsCiAgImF1dGhfdXJpIjogImh0dHBzOi8vYWNjb3VudHMuZ29vZ2xlLmNvbS9vL29hdXRoMi9hdXRoIiwKICAidG9rZW5fdXJpIjogImh0dHBzOi8vb2F1dGgyLmdvb2dsZWFwaXMuY29tL3Rva2VuIiwKICAiYXV0aF9wcm92aWRlcl94NTA5X2NlcnRfdXJsIjogImh0dHBzOi8vd3d3Lmdvb2dsZWFwaXMuY29tL29hdXRoMi92MS9jZXJ0cyIsCiAgImNsaWVudF94NTA5X2NlcnRfdXJsIjogImh0dHBzOi8vd3d3Lmdvb2dsZWFwaXMuY29tL3JvYm90L3YxL21ldGFkYXRhL3g1MDkvbHctY2ZnLWNlOTY4OTE2JTQwbGFjZXdvcmstZWNvc3lzdGVtMS5pYW0uZ3NlcnZpY2VhY2NvdW50LmNvbSIKfQo="
  description = "The private key in JSON format, base64 encoded (required when use_existing_service_account is set to true)"
}

variable "prefix" {
  type        = string
  default     = "lw-gcr"
  description = "The prefix that will be use at the beginning of every generated resource"
}

variable "lacework_integration_name" {
  type        = string
  default     = "TF GCR"
  description = "The integration name displayed in the Lacework UI."
}

variable "wait_time" {
  type        = string
  default     = "10s"
  description = "Amount of time to wait before the next resource is provisioned."
}

variable "registry_domain" {
  type        = string
  default     = "gcr.io"
  description = "The GCR domain, which specifies the location where you store the images. Supported domains are gcr.io, us.gcr.io, eu.gcr.io, or asia.gcr.io. Defaults to gcr.io."
}

variable "limit_by_tag" {
  type        = string
  default     = "*"
  description = "An image tag to limit the assessment of images with matching tag. If you specify limit_by_tag and limit_by_label limits, they function as an AND. Supported field input are mytext*mytext, mytext, mytext*, or mytext. Only one * wildcard is supported. Defaults to *."
}

variable "limit_by_label" {
  type        = string
  default     = "*"
  description = "An image label to limit the assessment of images with matching label. If you specify limit_by_tag and limit_by_label limits, they function as an AND. Supported field input are mytext*mytext, mytext, mytext*, or mytext. Only one * wildcard is supported. Defaults to *."
}

variable "limit_by_repos" {
  type        = string
  default     = ""
  description = "A comma-separated list of repositories to assess. This should be defined as a string. (without spaces recommended)"
}

variable "limit_num_imgs" {
  type        = string
  default     = "5"
  description = "The maximum number of newest container images to assess per repository. Must be one of 5, 10, or 15. Defaults to 5."
}
