class ShippingAddressEntity {
  String? name;
  String? phone;
  String? address;
  String? city;
  String? floor;
  String? email;

  ShippingAddressEntity({
    this.name,
    this.phone,
    this.address,
    this.city,
    this.floor,
    this.email,
  });

  @override
  String toString() {
    return '$address-$city مبني رقم $floor';
  }
}
