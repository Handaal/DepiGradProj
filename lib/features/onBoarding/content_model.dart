class OnboardingContent {
  String image;
  String title;
  String description;

  OnboardingContent({required this.image,required this.title, required this.description});
}

List<OnboardingContent> contents = [
  OnboardingContent(
    title: 'TrendyMart',
    image: 'Assets/images/Ecommerce web page-pana.png',
    description: "Discover a wide range of products, from the latest tech gadgets to stylish fashion, all in one place with easy navigation and exclusive deals tailored just for you",
  ),
  OnboardingContent(
    title: 'TrendyMart',
    image: 'Assets/images/Ecommerce checkout laptop-pana.png',
    description: "With just a few clicks, you can add your favorite items to the cart, choose your payment method, and place an order effortlessly, ensuring a smooth shopping experience",
  ),
  OnboardingContent(
    title: 'TrendyMart',
    image: 'Assets/images/Take Away-pana.png',
    description: "Fast and reliable delivery right to your doorstep, with real-time tracking and updates, so you always know where your package is and when it will arrive",
  ),
];