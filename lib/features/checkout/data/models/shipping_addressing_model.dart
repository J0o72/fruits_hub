import 'package:fruit_hub/features/checkout/domain/entities/shipping_address_entity.dart';

class ShippingAddressingModel {
  String? name;
  String? phone;
  String? address;
  String? city;
  String? email;
  String? floor;

  ShippingAddressingModel({
    this.name,
    this.phone,
    this.address,
    this.floor,
    this.city,
    this.email,
  });

  factory ShippingAddressingModel.fromEntity(
    ShippingAddressEntity shippingAddressEntity,
  ) {
    return ShippingAddressingModel(
      name: shippingAddressEntity.name,
      address: shippingAddressEntity.address,
      city: shippingAddressEntity.city,
      email: shippingAddressEntity.email,
      floor: shippingAddressEntity.floor,
      phone: shippingAddressEntity.phone,
    );
  }
}
