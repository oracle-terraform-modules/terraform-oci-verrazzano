# Copyright (c) 2023 Oracle Corporation and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

locals {
      all_ports = -1

  # keep as reference
  # apiserver_port          = 6443

  # Protocols
  # See https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml
  all_protocols = "all"
  icmp_protocol = 1
  tcp_protocol  = 6
  udp_protocol  = 17

  anywhere          = "0.0.0.0/0"
  rule_type_nsg     = "NETWORK_SECURITY_GROUP"
  rule_type_cidr    = "CIDR_BLOCK"
  rule_type_service = "SERVICE_CIDR_BLOCK"

  service_mesh_ports = [80, 443, 15012, 15017, 15021, 15443]

  # Todo verify if we need 15021 open for public
  public_lb_allowed_ports = [80, 443, 15021]

  thanos_policy_statement = "Allow any-user to manage objects in compartment id %s where all {request.principal.type='workload',request.principal.cluster_id='%s',request.principal.service_account='thanos-storegateway'}"

}