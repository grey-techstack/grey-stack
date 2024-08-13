resource "fortios_firewall_address" "testaddress" {
  allow_routing = "disable"
  #associated_interface = "port2"=if not exist will cause internal error 500，and no warning。
  color      = 3
  end_ip     = "255.255.255.0"
  name       = "terrafrom"
  start_ip   = "22.1.1.0"
  subnet     = "22.1.1.0 255.255.255.0"
  type       = "ipmask"
  visibility = "enable"
}