class ModelCard {
  final String name;
  final String image;
  final String code;
  bool? isSelect;

  ModelCard({
    required this.name,
    required this.image,
    required this.code,
    this.isSelect,
  });
}

final List<ModelCard> listCard = [
  ModelCard(
    name: 'Mastercard',
    image: 'assets/images/mastercard.png',
    code: '**** **** 1234',
    isSelect: false,
  ),
  ModelCard(
    name: 'Paypal',
    image: 'assets/images/paypal.png',
    code: '**** **** 1234',
    isSelect: false,
  ),
];
final List<ModelCard> listCardAdd = [
  ModelCard(
    name: 'Credit or Debit Card',
    image: 'assets/images/card.png',
    code: 'Pay with your Visa or Mastercard ',
    isSelect: false,
  ),
  ModelCard(
    name: 'Paypal',
    image: 'assets/images/paypal.png',
    code: '**** **** 1234',
    isSelect: false,
  ),
];

class ModelAddress {
  final String title;
  final String address;
  final String phone;
  final bool? isDefault;
  bool? isSelected;

  ModelAddress({
    required this.title,
    required this.address,
    required this.phone,
    this.isDefault,
    this.isSelected,
  });
}

final List<ModelAddress> listAddress = [
  ModelAddress(
    title: 'Home',
    address: 'Terk Thla, Sen Sok, Phnom Penh, Cambodia, 12101',
    phone: '+855 12 345 678',
    isDefault: true,
    isSelected: true,
  ),
  ModelAddress(
    title: 'Work',
    address: 'Terk Thla, Sen Sok, Phnom Penh, Cambodia, 12101',
    phone: '+855 12 345 678',
    isDefault: false,
    isSelected: false,
  ),
  ModelAddress(
    title: 'Other',
    address: 'Terk Thla, Sen Sok, Phnom Penh, Cambodia, 12101',
    phone: '+855 12 345 678',
    isDefault: false,
    isSelected: false,
  ),
];
