/**
 * Copyright 2020 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

variable "project_id" {
  type = string
}

variable "region" {
  type    = string
  default = "us-central1"
}

variable "zone" {
  type    = string
  default = "us-central1-c"
}

variable "spanner_name" {
  type    = string
  default = "autoscale-test"
}

variable "spanner_state_name" {
  type    = string
  default = "autoscale-test-state"
}

variable "spanner_state_database_name" {
  description = "Name of the Spanner database where the Autoscaler state is stored."
  type        = string
}

variable "terraform_spanner_test" {
  description = "If set to true, Terraform will create a Cloud Spanner instance and DB for testing."
  type        = bool
  default     = false
}

variable "terraform_spanner_state" {
  description = "If set to true, Terraform will create a Cloud Spanner instance and DB to hold the Autoscaler state."
  type        = bool
  default     = false
}

variable "terraform_new_spanner_state_instance" {
  description = "If set to true, Terraform will create a Cloud Spanner DB for state."
  type        = bool
  default     = false
}

variable "spanner_test_processing_units" {
  description = "Default processing units for test Spanner, if created"
  default     = 100
}

variable "spanner_state_processing_units" {
  description = "Default processing units for state Spanner, if created"
  default     = 100
}

variable "app_project_id" {
  description = "The project where the Spanner instance(s) live. If specified and different than project_id => centralized deployment"
  type        = string
  default     = ""
}

variable "terraform_dashboard" {
  description = "If set to true, Terraform will create a Cloud Monitoring dashboard including important Spanner metrics."
  type        = bool
  default     = true
}

locals {
  # By default, these config files produce a per-project deployment
  # If you want a centralized deployment instead, then specify
  # an app_project_id that is different from project_id
  app_project_id = var.app_project_id == "" ? var.project_id : var.app_project_id
}

variable "location" {
  type    = string
  default = "asia-northeast1"
}

variable "schedule" {
  type    = string
  default = "*/2 * * * *"
}

variable "time_zone" {
  type    = string
  default = "Asia/Tokyo"
}

variable "units" {
  type        = string
  default     = "PROCESSING_UNITS"
  description = "The measure that spanner size units are being specified in either: PROCESSING_UNITS or NODES"
}

variable "min_size" {
  type        = number
  default     = 100
  description = "Minimum size that the spanner instance can be scaled in to."
}

variable "max_size" {
  type        = number
  default     = 2000
  description = "Maximum size that the spanner instance can be scaled out to."
}

variable "scaling_method" {
  type        = string
  default     = "LINEAR"
  description = "Algorithm that should be used to manage the scaling of the spanner instance: STEPWISE, LINEAR, DIRECT"
}
