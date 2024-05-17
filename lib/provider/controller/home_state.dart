import 'package:flutter/material.dart';

class HomeState extends ChangeNotifier {
  int selectedPeriodIndex = 0;
  // Position? currentPosition;
  var currentAddress;
  var markerPositionLat = 0.0;
  var markerPositionLong = 0.0;
  List<String> horoscopeTime = ["Daily", "Weekly", "Monthly", "Yearly"];
  final List<IconData> icons = [
    Icons.star,
    Icons.favorite,
    Icons.thumb_up,
    Icons.shopping_cart,
    Icons.access_time,
  ];
  final List<String> titles = [
    'Star',
    'Favorite',
    'Thumb Up',
    'Shopping Cart',
    'Access Time',
  ];
  final List<Map<String, dynamic>> horoscopes = [
    {'name': 'Aries', 'icon': "https://astrologyk.com/img/horoscope/aries.jpg"},
    {
      'name': 'Taurus',
      'icon':
          "https://royaltyfreefootages.com/upload/video/Aries%20png,%20Golden%20Aries%20symbol%20PNG,%20zodiac%20sign%20Aries%20transparent%20png%20full%20hd%20images%20download_1658901499.png"
    },
    {
      'name': 'Gemini',
      'icon':
          "https://royaltyfreefootages.com/upload/video/Aries%20png,%20Golden%20Aries%20symbol%20PNG,%20zodiac%20sign%20Aries%20transparent%20png%20full%20hd%20images%20download_1658901499.png"
    },
    {
      'name': 'Cancer',
      'icon':
          "https://royaltyfreefootages.com/upload/video/Aries%20png,%20Golden%20Aries%20symbol%20PNG,%20zodiac%20sign%20Aries%20transparent%20png%20full%20hd%20images%20download_1658901499.png"
    },
    {
      'name': 'Leo',
      'icon':
          "https://royaltyfreefootages.com/upload/video/Aries%20png,%20Golden%20Aries%20symbol%20PNG,%20zodiac%20sign%20Aries%20transparent%20png%20full%20hd%20images%20download_1658901499.png"
    },
    {
      'name': 'Virgo',
      'icon':
          "https://royaltyfreefootages.com/upload/video/Aries%20png,%20Golden%20Aries%20symbol%20PNG,%20zodiac%20sign%20Aries%20transparent%20png%20full%20hd%20images%20download_1658901499.png"
    },
    {
      'name': 'Libra',
      'icon':
          "https://royaltyfreefootages.com/upload/video/Aries%20png,%20Golden%20Aries%20symbol%20PNG,%20zodiac%20sign%20Aries%20transparent%20png%20full%20hd%20images%20download_1658901499.png"
    },
    {
      'name': 'Scorpio',
      'icon':
          "https://royaltyfreefootages.com/upload/video/Aries%20png,%20Golden%20Aries%20symbol%20PNG,%20zodiac%20sign%20Aries%20transparent%20png%20full%20hd%20images%20download_1658901499.png"
    },
    {
      'name': 'Sagittarius',
      'icon':
          "https://royaltyfreefootages.com/upload/video/Aries%20png,%20Golden%20Aries%20symbol%20PNG,%20zodiac%20sign%20Aries%20transparent%20png%20full%20hd%20images%20download_1658901499.png"
    },
    {
      'name': 'Capricorn',
      'icon':
          "https://thumbs.dreamstime.com/z/capricorn-zodiac-sign-capricorn-circle-ai-generated-capricorn-zodiac-sign-capricorn-circle-ai-generated-ai-generated-295336946.jpg?ct=jpeg"
    },
    {
      'name': 'Aquarius',
      'icon':
          "https://thumbs.dreamstime.com/z/capricorn-zodiac-sign-capricorn-circle-ai-generated-capricorn-zodiac-sign-capricorn-circle-ai-generated-ai-generated-295336946.jpg?ct=jpeg"
    },
    {
      'name': 'Pisces',
      'icon':
          'https://thumbs.dreamstime.com/z/capricorn-zodiac-sign-capricorn-circle-ai-generated-capricorn-zodiac-sign-capricorn-circle-ai-generated-ai-generated-295336946.jpg?ct=jpeg'
    },
  ];
  final List<Map<String, dynamic>> testimonialList = [
    {
      "creator": "John Doe",
      "date": "2024-01-05",
      "review":
          "This is a great blog post with interesting content. I highly recommend reading it!",
      "rating": 4.5
    },
    {
      "creator": "Jane Smith",
      "date": "2024-01-06",
      "review":
          "Excellent insights shared in this blog. The author has a deep understanding of the subject.",
      "rating": 5.0
    },
    {
      "creator": "Bob Johnson",
      "date": "2024-01-07",
      "review":
          "I found this blog very informative. The author presents the information in a clear and concise manner.",
      "rating": 4.0
    },
    {
      "creator": "Alice Brown",
      "date": "2024-01-08",
      "review":
          "The content in this blog is eye-opening. I learned a lot from it. Highly recommended!",
      "rating": 4.8
    },
    {
      "creator": "Charlie White",
      "date": "2024-01-09",
      "review":
          "The author did an excellent job covering the topic. I enjoyed reading every bit of it.",
      "rating": 4.7
    },
    {
      "creator": "Eva Green",
      "date": "2024-01-10",
      "review":
          "I appreciate the author's perspective in this blog. The content is thought-provoking.",
      "rating": 4.2
    },
    {
      "creator": "David Black",
      "date": "2024-01-11",
      "review":
          "The blog provides valuable insights. Well-written and engaging.",
      "rating": 4.6
    },
    {
      "creator": "Grace Taylor",
      "date": "2024-01-12",
      "review":
          "The author does a fantastic job presenting complex concepts in an easy-to-understand manner.",
      "rating": 4.9
    },
    {
      "creator": "Sam Wilson",
      "date": "2024-01-13",
      "review":
          "I enjoyed reading this blog. The information is relevant and up-to-date.",
      "rating": 4.3
    },
    {
      "creator": "Olivia Hall",
      "date": "2024-01-14",
      "review":
          "The blog is well-researched and provides valuable insights into the topic.",
      "rating": 4.4
    }
  ];

  final List<Map<String, dynamic>> notifications = [
    {
      "title": "Meeting Reminder",
      "description": "Discuss project updates and timelines with the team.",
      "time": "2024-01-07T12:30:00Z",
      "location": "Conference Room A"
    },
    {
      "title": "Deadline Approaching",
      "description": "Submit quarterly report by end of the day.",
      "time": "2024-01-08T15:45:00Z",
      "location": "Your Desk"
    },
    {
      "title": "New Email Received",
      "description": "Check and respond to important client email.",
      "time": "2024-01-09T09:00:00Z",
      "location": "Your Inbox"
    },
    {
      "title": "Task Completed",
      "description":
          "Notify the team about the successful completion of Task #123.",
      "time": "2024-01-10T18:20:00Z",
      "location": "Project Management Tool"
    },
    {
      "title": "Appointment Tomorrow",
      "description":
          "Medical check-up scheduled for tomorrow. Prepare necessary documents.",
      "time": "2024-01-11T14:10:00Z",
      "location": "Medical Center"
    },
    {
      "title": "Project Update",
      "description":
          "Review the latest project updates and prepare for the client meeting.",
      "time": "2024-01-12T08:55:00Z",
      "location": "Your Office"
    },
    {
      "title": "Team Meeting Reminder",
      "description":
          "Team meeting to discuss current projects and address any concerns.",
      "time": "2024-01-13T11:25:00Z",
      "location": "Conference Room B"
    },
    {
      "title": "Client Call Scheduled",
      "description":
          "Prepare for the client call to discuss upcoming project milestones.",
      "time": "2024-01-14T17:30:00Z",
      "location": "Virtual Meeting"
    },
    {
      "title": "Training Session Today",
      "description": "Attend training session on the new software update.",
      "time": "2024-01-15T13:40:00Z",
      "location": "Training Room"
    },
    {
      "title": "Bug Fixing Session",
      "description":
          "Collaborate with the development team to address and fix reported bugs.",
      "time": "2024-01-16T10:15:00Z",
      "location": "Development Team Area"
    },
    {
      "title": "Product Release Tomorrow",
      "description":
          "Finalize and test the product release scheduled for tomorrow.",
      "time": "2024-01-17T16:50:00Z",
      "location": "Testing Environment"
    },
    {
      "title": "Weekly Report Due",
      "description":
          "Complete and submit the weekly progress report to the manager.",
      "time": "2024-01-18T20:05:00Z",
      "location": "Your Desk"
    },
    {
      "title": "Team Lunch Today",
      "description": "Join the team for a casual lunch to build camaraderie.",
      "time": "2024-01-19T07:45:00Z",
      "location": "Office Cafeteria"
    },
    {
      "title": "Client Presentation",
      "description":
          "Prepare for the client presentation scheduled for today afternoon.",
      "time": "2024-01-20T14:55:00Z",
      "location": "Client's Office"
    },
    {
      "title": "Project Kickoff Meeting",
      "description":
          "Kickoff meeting for the new project. Discuss project scope and objectives.",
      "time": "2024-01-21T09:30:00Z",
      "location": "Conference Room A"
    }
  ];
  final List<Map<String, dynamic>> astrologerList = [
    {
      "name": "Alice Smith",
      "specialist": "Horoscope",
      "rating": 4.5,
      "live": true,
      "image": "https://i.pravatar.cc/300"
    },
    {
      "name": "Bob Johnson",
      "specialist": "Natal Chart",
      "rating": 3.8,
      "live": false,
      "image": "https://i.pravatar.cc/103"
    },
    {
      "name": "Catherine Brown",
      "specialist": "Relationships",
      "rating": 4.0,
      "live": true,
      "image": "https://i.pravatar.cc/700"
    },
    {
      "name": "David Wilson",
      "specialist": "Career",
      "rating": 4.2,
      "live": true,
      "image": "https://i.pravatar.cc/500"
    },
    {
      "name": "Eva Miller",
      "specialist": "Astrology Basics",
      "rating": 3.5,
      "live": false,
      "image": "https://i.pravatar.cc/500"
    },
    {
      "name": "Frank White",
      "specialist": "https://i.pravatar.cc/500",
      "rating": 4.8,
      "live": true,
      "image": "https://i.pravatar.cc/500"
    },
    {
      "name": "Grace Davis",
      "specialist": "Financial Astrology",
      "rating": 4.1,
      "live": false,
      "image": "https://i.pravatar.cc/500"
    },
    {
      "name": "Henry Johnson",
      "specialist": "Health and Wellness",
      "rating": 3.9,
      "live": true,
      "image": "https://i.pravatar.cc/500"
    },
    {
      "name": "Isabel Martin",
      "specialist": "Spiritual Growth",
      "rating": 4.6,
      "live": true,
      "image": "https://i.pravatar.cc/500"
    },
    {
      "name": "Jack Turner",
      "specialist": "Vedic Astrology",
      "rating": 4.4,
      "live": false,
      "image": "https://i.pravatar.cc/500"
    },
    {
      "name": "Katherine Davis",
      "specialist": "Tarot Reading",
      "rating": 3.7,
      "live": true,
      "image": "https://i.pravatar.cc/500"
    },
    {
      "name": "Leo Martinez",
      "specialist": "Dream Analysis",
      "rating": 4.2,
      "live": false,
      "image": "https://i.pravatar.cc/500"
    },
    {
      "name": "Mia Clark",
      "specialist": "Astrological Remedies",
      "rating": 4.3,
      "live": true,
      "image": "https://i.pravatar.cc/500"
    },
    {
      "name": "Nathan Taylor",
      "specialist": "Numerology",
      "rating": 4.7,
      "live": true,
      "image": "https://i.pravatar.cc/500"
    },
    {
      "name": "Olivia Baker",
      "specialist": "Karmic Astrology",
      "rating": 4.0,
      "live": false,
      "image": "https://i.pravatar.cc/500"
    }
  ];

  int selectedScreen = 0;

  HomeState() {
    init();
  }

  init() async {
    
  }

  void onScreenTapped(int index) {
    selectedScreen = index;
    notifyListeners();
  }

  void updateSelectedHoroscopePeriod(int index) {
    selectedPeriodIndex = index;
    notifyListeners();
  }

  bool loading = false;

  /// ------ api call ---*


 

 


}
