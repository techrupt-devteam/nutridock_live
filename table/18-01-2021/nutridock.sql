-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 18, 2021 at 08:39 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nutridock`
--

-- --------------------------------------------------------

--
-- Table structure for table `about_us`
--

CREATE TABLE `about_us` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `about` text NOT NULL,
  `our_mission` text NOT NULL,
  `our_goals` text NOT NULL,
  `image1` varchar(255) NOT NULL,
  `image2` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_deleted` enum('No','Yes') NOT NULL,
  `status` enum('Active','Inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `about_us`
--

INSERT INTO `about_us` (`id`, `title`, `about`, `our_mission`, `our_goals`, `image1`, `image2`, `created_at`, `updated_at`, `is_deleted`, `status`) VALUES
(1, 'Welcome to Nutridock', '<p style=\"text-align:justify\">We firmly believe that getting fit is not about dieting but about eating right. We think of food as fuel and medicine for our bodies and help you make the shift from restrictive dieting to mindful eating, in a way that is easy and enjoyable.</p>\r\n\r\n<p style=\"text-align:justify\">With research-backed information and personalised nutrition advice, we help you create sustainable eating habits that will last a lifetime. There is no greater testimony to the Nutridock philosophy than the fitness journey of our very own founder, who felt an immense shift in his physical and mental well-being when he adopted a healthy lifestyle that was centred around good nutrition.</p>\r\n\r\n<p style=\"text-align:justify\">At Nutridock, we believe that if we want the world to change and progress, we must start with ourselves. So join us on this journey of building a sustainable healthy lifestyle, and let&#39;s make this world a healthier place!</p>', '<p style=\"text-align:justify\">To impart knowledge about the importance of good nutrition in the journey to physical, mental and emotional well-being. We aim to guide people in their wellness journeys by giving them research-based information about food and highlight the significance of proper nutrition on the progress of their fitness journeys.</p>', '<p style=\"text-align:justify\">To be the go-to source of information about food and nutrition, and educate people so that healthy living comes naturally. We want to be the catalyst for a nutrition revolution that is centred around embracing food as fuel.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<h2 style=\"font-style:italic\">&nbsp;</h2>', 'b761e3a0b22724200f9f3d215154d48c6ca4a79e.jpg', '0f0e13fe971aebdc30c8353eccc44401f69872b4.png', '2020-10-16 17:13:58', '2020-12-01 11:18:26', 'No', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `benefits`
--

CREATE TABLE `benefits` (
  `id` int(11) NOT NULL,
  `blog_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `title` varchar(255) NOT NULL,
  `title_description` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_deleted` enum('No','Yes') NOT NULL,
  `status` enum('Active','Inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `benefits`
--

INSERT INTO `benefits` (`id`, `blog_id`, `description`, `title`, `title_description`, `image`, `created_at`, `updated_at`, `is_deleted`, `status`) VALUES
(1, 3, 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et', '1. Good for your gut', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et', 'f8a0e4f670e4d51ff9259fba1e9905e77bedb974.jpg', '2020-10-22 14:32:24', '2020-10-30 16:27:43', 'No', 'Active'),
(2, 3, 'Keeps your heart healthy', '2. Keeps your heart healthy', 'With cabbage being high in fiber and water content, it helps propel food through your digestive tract and aid normal bowel movement. It is even healthier if cabbage is consumed in fermented form where it acts as a probiotic, rich in good bacteria which keeps the gut healthy. Cabbage also helps relieve symptoms of gastritis (inflammation in stomach wall), stomach ulcers, and irritable bowel syndrome (ulcerative colitis and Crohn’s disease) due to its high fiber content.', 'cb63aaac26e0a26252c330b78e6f78aed0f6cbb3.jpg', '2020-10-22 15:39:54', '2020-10-30 16:27:50', 'No', 'Active'),
(5, 4, 'kopjkpkj99', 'kyptylp[99', 'hkgkhlljy99', 'd6b612d4f279d29cbec50573f00a260aa6a49fc6.jpg', '2020-10-22 15:47:05', '2020-10-22 15:47:19', 'No', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `blog`
--

CREATE TABLE `blog` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `blog_title` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `blog_description` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `meta_title` varchar(500) NOT NULL,
  `meta_keywords` varchar(500) NOT NULL,
  `meta_description` text NOT NULL,
  `image_title` varchar(500) NOT NULL,
  `image_description` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_deleted` enum('No','Yes') NOT NULL,
  `status` enum('Active','Inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `blog`
--

INSERT INTO `blog` (`id`, `category_id`, `blog_title`, `link`, `blog_description`, `image`, `meta_title`, `meta_keywords`, `meta_description`, `image_title`, `image_description`, `created_at`, `updated_at`, `is_deleted`, `status`) VALUES
(10, 1, '6 Ways to Strengthen Your Immune System', '', '<p>Our immune system is always on the frontlines fighting against bacteria, viruses and germs that could potentially cause illness in our body. As we get older or unknowingly eat too much junk and exercise too little, this immune function starts becoming weak. But there are some key lifestyle changes we can implement to ensure that we aid this system and protect ourselves against infections and disease.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>1. Stick to whole foods</strong></p>\r\n\r\n<p>Overprocessed, packaged and refined foods have become a staple in our kitchens and the more we rely on them, the more we are susceptible to illness. This is because our bodies were meant to eat more of whole grains, fresh fruits and vegetables and less of packaged bread, fried snacks and instant or ready meals.</p>\r\n\r\n<p>Cook fresh food as often as possible and supplement your grains like rice, wheat, jowar, bajra and quinoa with protein-rich pulses, eggs or meat, and nutrient powerhouses like raw veggies and fruits.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>2. Embrace sleep</strong></p>\r\n\r\n<p>When you sleep, your body has the chance to restore itself and prepare your immune system to keep you healthy the next day. On average, adults need 7 or more hours of sleep every night, teens need 8 to 10 hours and young children need as many as 14 hours of sleep.&nbsp;</p>\r\n\r\n<p>Deep, good-quality sleep has been found to be closely tied to a strong immune system, so stay away from your phone and TV an hour before bedtime, and listen to a calming guided meditation instead.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"http://nutridock.com/nutridock_restaurant/uploads/ckeditor/images/cb45a76d72162d95fa139c802ca41cbd465f8d88_1605700765.jpg\" style=\"height:394px; width:800px\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>3. Exercise is key</strong></p>\r\n\r\n<p>We all know the benefits of exercise. It makes us feel good and look amazing, but it also plays an important role in strengthening your body internally. <a href=\"https://pubmed.ncbi.nlm.nih.gov/26477922/\">It was found that</a> even just one session of moderate exercise can boost the effectiveness of vaccines in people with weak immune systems. Regular exercise also reduces inflammation in your body, thus helping your immune system perform its best.</p>\r\n\r\n<p>Do a mix of strength training and moderate cardio 4-5 times a week, and you&rsquo;re on your way to having a healthy body inside and out.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>4. Include superfoods in your diet</strong></p>\r\n\r\n<p>&lsquo;Superfoods&rsquo; may seem like a diet fad, but these ingredients are power-packed with immune-boosting properties that significantly improve your chances of fighting off infectious diseases. And some of these ingredients are already in your Indian kitchen, so you don&rsquo;t have to shell out money for fancy, imported foods!</p>\r\n\r\n<p>Add these into your daily diet: immune-boosting ginger and garlic, antioxidant powerhouses like colourful seasonal fruits, carrots and spinach, infection-destroying turmeric, and Vitamin C rich limes, amla and tomatoes.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>5. Focus on micronutrients</strong></p>\r\n\r\n<p>Our body&rsquo;s immune response is greatly affected by the delicate balance of vitamins, minerals and micronutrients. Deficiencies in Vitamin B12 and D3 are all too common, and they often manifest as feeling excessively tired and lethargic, increased hair fall, dry and sensitive skin and most importantly, constantly falling ill due to a weakened immune system.</p>\r\n\r\n<p>For increasing your Vitamin D3 levels, nothing works as well as getting in some sunlight. Do some light exercises or go out for a walk in the early morning sun, and you will instantly feel your muscles and mood improve. To correct a Vitamin B12 deficiency, increase your intake of animal products like fish and eggs, milk and other dairy products, and B12-fortified soymilk, yoghurt and cereals. Strict vegetarians and vegans are more prone to a B12 deficiency, so including a supplement could drastically increase your physical and mental health.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>6. Manage stress</strong></p>\r\n\r\n<p>When stress starts affecting your body physically by causing headaches, tense muscles and tiredness, you know it&rsquo;s time to take action. Long-term stress is known to increase inflammation in the body and suppresses immune function, even in young children.</p>\r\n\r\n<p>Embrace regular exercise, meditation, journaling, yoga, art, sewing, playing with your pets - anything that calms the mind and body. If you feel your stress becoming unmanageable, talk to a licensed therapist or counsellor.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Improving your immunity is not an overnight process and certainly does not happen by ingesting one particular food or herbal drink. But a few key lifestyle changes can help ensure that your immune system is strong and protects you from every virus or bacteria that comes your way!</p>', 'a7c43f6b29f58cbdd43f894620407489d1585022.jpg', '', '', '', '', '', '2020-11-17 17:40:49', '2020-11-21 19:11:15', 'No', 'Active'),
(11, 3, 'Busting 6 Popular Food & Nutrition Myths', '', '<p>We are surrounded by confusing and contradictory food and nutrition advice on the internet, in our homes and even from dieticians. Over the years, some food myths have become so prevalent that we have started to believe them as fact. It&rsquo;s time to educate ourselves and dispel these myths.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>#1 Fat-free or low-fat snacks are better than their full-fat versions</strong></p>\r\n\r\n<p>There is an entire industry created to feed off people&rsquo;s fear of fatty foods. But the simple fact is that every time fat is removed from a snack, it is usually replaced by more sugar, salt and other additives to retain the yummy taste. Yes, even in the &lsquo;baked&rsquo; versions of crunchy chips. While there is nothing wrong in eating these snacks, you may be fooled into thinking that you do not have to control your portions because they are low-fat, and will end up overeating.&nbsp;</p>\r\n\r\n<p>If you get cravings for crunchy, salty foods (we all do!), eat a small, controlled portion of your favourite chips and save the rest for later. If you think you are not yet disciplined enough to do this, replace the snacks with a few nuts like peanuts, pista and cashews so you get your crunchy fix while also getting in some micronutrients and healthy fats.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>#2 Eggs are bad news if you want to control your cholesterol levels</strong></p>\r\n\r\n<p>Unless you have been advised by your doctor or a certified nutritionist, there is no need to stay away from eggs or egg yolk in your daily diet. In fact, eggs are an inexpensive powerhouse of nutrients like zinc, iron, Vitamin D and more, all of which are important to keep our brain and bodies healthy and happy. <a href=\"https://www.mdpi.com/2072-6643/10/9/1272\">A study conducted in 2018</a> found that eggs in themselves do not contribute to having high cholesterol. That is usually the result of a poor, unbalanced diet and lack of exercise over many years.&nbsp;</p>\r\n\r\n<p>If you do eat eggs, safely add one whole egg (with the egg yolk) or one whole egg plus one egg white into your daily diet and feel your health improve.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>#3 Carbs are the enemy</strong></p>\r\n\r\n<p>It&rsquo;s actually the overprocessed, refined grains that are the enemy. A healthy portion of rice, wheat, jowar, bajra, etc. in our daily diets is essential to create balanced meals that keep us full for longer. Same goes for starchy vegetables like potatoes and yams. When paired with proteins and fats, carbs make a complete meal that keeps us satiated and energised throughout the day. That means fewer cravings and lower dependence on caffeine.</p>\r\n\r\n<p>Embrace whole grains in your daily diet and eat bread, instant noodles and pasta in moderation. <a href=\"https://www.bmj.com/content/353/bmj.I2716.full\">Research shows</a> that people who centre the majority of their diet around whole grains are 20-30% less likely to suffer from heart disease.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>#4 I work out, so I can eat what I want</strong></p>\r\n\r\n<p>Regular exercise is vital to keep our bodies and mind healthy. But we need to move away from thinking of exercise as just a way to burn calories and more as an integral part of our lifestyle. As they say, &lsquo;you cannot outrun a bad diet&rsquo;. So if you are using your exercise regimen as an excuse to eat unbalanced meals that are full of salty, processed foods you will eventually see the consequences on your waistline and health. Additionally, unless you are a pro athlete and spend hours doing intense exercise, it does not really burn that many calories.</p>\r\n\r\n<p><a href=\"https://www.health.harvard.edu/diet-and-weight-loss/calories-burned-in-30-minutes-of-leisure-and-routine-activities\">This Harvard Health article</a> gives you a breakdown of the average calories burned in each workout. For example, a 70kg person doing high-impact aerobics for half an hour burns 260 calories. In comparison, a regular-sized Snickers bar (52 grams) has around 250 calories. It&rsquo;s that easy to undo all your hard work! Complement your workouts with balanced, nutritious meals, so you can indulge in your favourite treats occasionally.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>#5 Brown bread is better than white</strong></p>\r\n\r\n<p>Don&rsquo;t be swayed by what the front of any food package says. Always flip it over and read the ingredients. We are made to believe that brown bread is better because it is made with whole wheat but in reality, it is the same &lsquo;white&rsquo; bread that has been dyed brown. If you are looking for a healthier alternative to white bread, you should see &lsquo;whole wheat&rsquo; listed first in the ingredients list. Anything else is almost always a gimmick.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>#6 Eating after 8 PM spells doom for your diet</strong></p>\r\n\r\n<p>While most of us eat our big meals at around the same time during the day, we also have to take into consideration different diet and sleep patterns. So while a 7 PM mealtime works great for someone who sleeps by 10-10:30, it could cause problems for others.</p>\r\n\r\n<p>Say you&rsquo;re a night owl and prefer working or studying well into the night and don&rsquo;t sleep before midnight. Sticking to a 7 PM mealtime just because it&rsquo;s deemed healthy is a surefire way to ensure that you go to bed hungry, are unable to concentrate, or give in to your cravings and end up snacking on unhealthy foods. Instead, tailor your meal times around your schedule, eat your last meal two hours before you sleep and be more mindful of eating balanced meals while staying within your calorie range. Add in a daily moderate workout, and you will be as healthy as anyone else following a strict 8 PM dinner time schedule.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>With so much misinformation floating around on social media and even being passed down the generations in our families, it&rsquo;s easy to fall for fads and prevalent myths. If you need guidance for your diet, always consult a registered nutritionist.</p>', 'b4eff1ef8291a734f5b44f81fe8bec83389e0b0d.jpg', '', '', '', '', '', '2020-11-18 17:33:52', '2020-11-21 19:10:52', 'No', 'Active'),
(12, 1, '9 Nutritious Snacks You Can Include in Your Healthy Diet', '', '<p>When you start a diet plan or embark on a fitness journey, the first thing you are asked to throw out of your kitchen is &lsquo;snacks&rsquo;. Most of the snacks we crave are high-fat, salty, crunchy or sweet treats, but there are also nutritious alternatives that can be a regular part of your healthy eating lifestyle.</p>\r\n\r\n<p>Here are some healthy snack ideas that are filling and nutritious, while also satisfying your mid-meal cravings.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Homemade Ragi &amp; Oats Crackers</strong></li>\r\n</ul>\r\n\r\n<p>Crackers made of ragi flour, oats and wholewheat flour are delicious on their own, and also the perfect vehicle for dips like hummus, salsa, yoghurt and mint chutney.</p>\r\n\r\n<p>Mix all the flours with some green chilli and garlic paste and salt. Roll out into a thin sheet and bake until crispy. Cut into bite-size squares as soon as it&#39;s done baking and let it cool. Make a large batch and keep it as a handy replacement of your favourite biscuit.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Baked Sweet Potato Fries</strong></li>\r\n</ul>\r\n\r\n<p>A rich source of Vitamins A and C, fibre and potassium, sweet potatoes are the nutritious replacement for potato wedges and chips. Slice a sweet potato lengthwise, toss with a drizzle of olive oil, salt, pepper and dried herbs like oregano, and bake until crispy. You can also fry them on a non-stick pan to avoid using excess oil.</p>\r\n\r\n<p>Another great way to eat sweet potato as a snack is to pressure cook until soft, mash it to your desired consistency and dress with lemon juice, salt and chaat masala for a desi twist to mashed potatoes!&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Energising Fruit Smoothie</strong></li>\r\n</ul>\r\n\r\n<p>A smoothie does not always have to be a calorie-dense replacement for a meal. It can be a great way to eat your fruits if you&#39;re not fond of eating them whole. The fibre in the fruit will also keep you full until your next meal.</p>\r\n\r\n<p>A banana chocolate smoothie made with skim milk and unsweetened cocoa powder is a great pre-exercise snack, not to mention delicious! Add a scoop of whey or vegan protein powder for an extra dose of macronutrients before a challenging workout.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Dhokla and Idli</strong></li>\r\n</ul>\r\n\r\n<p>Fermented foods like idlis and dhoklas are delicious while being healthy, and are a great option when you crave Indian comfort food during snack time. The fermentation process makes them both nutritious with higher levels of iron and calcium, and make you feel full with smaller portions.</p>\r\n\r\n<p>Pair your dhokla with mint chutney and the idlis with sambar for a power-packed snack that will keep your energised for hours. Skip the sweet chutneys to avoid too much sugar.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Veggies with Hummus</strong></li>\r\n</ul>\r\n\r\n<p>Hummus made with chickpeas, olive oil and garlic is filling and full of healthy fats and plant protein, and is known to reduce inflammation. It&#39;s also great for meal prepping your snacks for a few days. Make a big batch and save it in the fridge for when you start feeling a little hungry.</p>\r\n\r\n<p>Pair creamy hummus with crunchy veggies like carrot and cucumber for the perfect combination of proteins, fats and fibre.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Healthy Bhel</strong></li>\r\n</ul>\r\n\r\n<p>A universally loved snack, it&#39;s simple to create a healthier and more nutritious version of the beloved bhel. To the puffed rice, add fresh cut veggies like onion and tomatoes, a few sprigs of coriander leaves and some salt and chaat masala.&nbsp;</p>\r\n\r\n<p>In the healthy version, replace the fried puri and sev with roasted peanuts and sprouted moong. This recipe can also be replicated with boiled rajma or kala chana instead of the puffed rice, for an extra kick of protein.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Travel-friendly snacks</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Apple and Peanut/Almond butter</strong></li>\r\n</ul>\r\n\r\n<p>This is a classic combination for a reason - everyone loves it, it requires zero prep and satisfies your taste buds while giving you a healthy kick of micronutrients, fibre and healthy fats.</p>\r\n\r\n<p>Slice one apple lengthwise. Pair it with one tablespoon of peanut/almond butter. Don&#39;t exceed this amount of nut butter, since it&#39;s high in fat and sugars, and can quickly become a calorie bomb!</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Dark chocolate and nuts</strong></li>\r\n</ul>\r\n\r\n<p>Sometimes the only thing that can satisfy a sweet craving is a piece of rich, delicious dark chocolate. Eating it with nuts like almonds and walnuts makes for a filling snack that satisfies your tastebuds while being rich in magnesium and heart-healthy fats.</p>\r\n\r\n<p>Opt for a piece of dark chocolate that is 70% or higher cocoa. Pair this with 3-4 almonds or walnuts, which will help in controlling your appetite until the next big meal.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Popcorn or Makhana</strong></li>\r\n</ul>\r\n\r\n<p>Perfect for when you want to snack on a large serving of something crunchy, without having to worry about the calories! Makhana is also a rich source of protein while being as delicious and satisfying to munch on as popcorn.</p>\r\n\r\n<p>Pop a handful of corn kernels in a pan, with just a drizzle of vegetable oil and top with a pinch of salt. For the makhana, lightly roast two handfuls in some ghee and sprinkle rock salt, pepper and chilli powder for a satisfying chai-time snack.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Time your snacks 2-3 hours after a big meal and at least an hour before you work out. Mid-meal snacks play an important role in regulating your hunger, blood sugar levels and mood. Keeping a long gap of time between meals can make you feel fatigued and irritable, and affect your workouts. These healthy snacks help keep you energised throughout the day!</p>\r\n\r\n<p><br />\r\n&nbsp;</p>', '889fed290a1f4619d2a2cff02ee32785318b87e5.jpg', '', '', '', '', '', '2020-11-18 17:39:09', '2020-11-21 19:14:59', 'No', 'Active'),
(13, 2, '8 Key Lifestyle Changes to Manage Diabetes', '', '<p>Diabetes is one of the most prevalent lifestyle diseases in India and around the world. With increasingly sedentary jobs and consumption of processed foods, it&#39;s only getting more common. While medication is necessary to control diabetes, some basic lifestyle changes can make it significantly more manageable.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>First, understanding the basics of diabetes can help in addressing its symptoms:</p>\r\n\r\n<ul>\r\n	<li>It is the presence of excessive glucose (commonly called &#39;sugar&#39;) in your blood</li>\r\n	<li>Insulin, a hormone produced in the pancreas, guides glucose from the food you eat to muscles all over your body to give you energy throughout the day</li>\r\n	<li>The problem starts when your body doesn&#39;t make enough - or any - insulin, or is not able to use it well</li>\r\n	<li>This causes the percentage of glucose to increase in your blood. In the long run, this can affect your weight, mood, skin and the health of your internal organs</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Regularly eating high-fat, high-sugar foods, not exercising enough and having a parent or grandparent with diabetes all increase your chances of having it. However, whether you are pre-diabetic or already have diabetes, here are some lifestyle changes you can make to manage the disease.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong><em>1) Eat Smaller Portions</em></strong></p>\r\n\r\n<p>To avoid sugar crashes after a big carb-rich meal, start by having smaller portions of wholesome homemade foods. This way your body will not have to metabolise a lot of glucose at once, and you can avoid the feeling of tiredness and drowsiness that comes after a big meal.</p>\r\n\r\n<p>Keep healthy snacks handy to avoid a large gap in between meals. Veggie sticks, 3-4 almonds or walnuts and some yoghurt/chaas are good options.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong><em>2) Go Green</em></strong></p>\r\n\r\n<p>Increase the quantity of leafy greens in your daily diet. Spinach, methi (fenugreek), shepu (dill) and sarson (mustard greens) are nutrient powerhouses. Being rich in Vitamin C, they help control the levels of fasting blood sugar in those with Type 2 diabetes.</p>\r\n\r\n<p>There is no limit to the portions of greens you can eat in a day! Add them in smoothies, throw a handful into dals and curries and use them as a base for salads.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong><em>3) Embrace Fruits</em></strong></p>\r\n\r\n<p>A common misunderstanding about the diabetic diet plan is that anything sweet, including fruits, is to be avoided. Instead, practise moderation and choose the fruits you eat wisely. You don&#39;t want to miss out on those precious vitamins that you can only get from fruit.</p>\r\n\r\n<p>Oranges, seasonal berries, apples and grapes are you best friends! 100-150 grams (about one medium apple) a day is the recommended portion size. Enjoy fruits like bananas, papaya and chikoo (sapota) 2-3 times a week.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong><em>4) The Plate Method</em></strong></p>\r\n\r\n<p>Instead of making meal planning too complicated or stressing yourself out by counting the calories in every bite you eat, follow the &#39;plate method&#39;. Divide your plate into two halves:</p>\r\n\r\n<p><strong>1st half</strong>: fill it with vegetables - raw, steamed or boiled. Choose leafy greens, broccoli, beans, carrots, cucumber and any other veggies you enjoy eating. If you are eating your veggies in the form of Indian sabzis, use minimal oil. Remember, starchy vegetables like potatoes and corn should be eaten in moderation.</p>\r\n\r\n<p><strong>2nd half</strong>: divide this part into two again</p>\r\n\r\n<p>In the first half, add protein sources - eggs, chicken or fish if you&#39;re non-vegetarian; or dals and beans like chickpeas and kidney beans if you are vegetarian/vegan.</p>\r\n\r\n<p>In the second half, add whole grains like brown rice, whole wheat, oats and quinoa.</p>\r\n\r\n<p>Follow this ratio of vegetables-protein-whole grains for every meal, and your diet will improve effortlessly.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong><em>5) Include Healthy Fats</em></strong></p>\r\n\r\n<p>The healthy fats in olive oil, moderate amounts of ghee, nuts, seeds and fatty fish help to decrease the likelihood of developing heart diseases; which is a side effect of having long-term diabetes. Remove saturated fats like excessive coconut oil and deep-fried foods from your diet.</p>\r\n\r\n<p>If you are worried about your fat intake or are on a low-fat diet to control your diabetes, a great way to ensure that you get your recommended amount of daily Omega 3 is a fish oil or flaxseed supplement.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong><em>6) Upgrade Your Kitchen Pantry</em></strong></p>\r\n\r\n<p>While the focus should be on improving your nutrition as a whole, you can also include some basic pantry ingredients to increase your body&#39;s chances of healing itself from within. Include these superfoods in your daily diet:</p>\r\n\r\n<p><strong>Cinnamon</strong> - an antioxidant powerhouse, cinnamon has shown to be effective in improving insulin sensitivity. Limit your daily intake to 1 teaspoon of high-quality cinnamon powder. Sprinkle it on fruits or oatmeal, or add it to a delicious glass of lemon honey cinnamon cooler!</p>\r\n\r\n<p><strong>Chia seeds</strong> - rich in fibre, good fats and plant protein, chia seeds are famous for being cooling for the body. Add a teaspoon to your water bottle and keep sipping on it all day, or sprinkle the seeds over your daily oatmeal or smoothie.&nbsp;</p>\r\n\r\n<p><strong>Flaxseeds</strong> - a great option for vegetarians and vegans who cannot get their daily intake of healthy fats from fish, flaxseeds also reduce the risk of getting a stroke. For easier nutrient absorption, lightly roast the seeds and grind them. Add one teaspoon to chaas and fruit smoothies for a filling and nutritious snack.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong><em>7) Move Your Body</em></strong></p>\r\n\r\n<p>Exercise is beneficial for everybody, but even more so for people suffering from lifestyle diseases like diabetes. Regular exercise keeps your blood glucose level in check, which in turn makes you feel energetic and alert.</p>\r\n\r\n<p>Weight management is a vital aspect of controlling diabetes. Being overweight and obese increases your chances of having diabetes, and having diabetes increases your chances of being overweight. The only way to break this vicious cycle is to make exercise a part of your life.</p>\r\n\r\n<p>Aim for at least 30 minutes of moderate or vigorous physical activity 5 days a week. Do a mix of cardio and strength training to build lean muscle while maintaining a healthy weight.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong><em>8) Calm Your Mind</em></strong></p>\r\n\r\n<p>Having diabetes increases your chances of also developing other issues like hypertension and even stroke. Since excessive stress is the cause of these diseases, learning to manage it is vitally important.&nbsp;</p>\r\n\r\n<p>Yoga and meditation have proven to be the most effective methods to control stress. Along with regular exercise, this significantly improves your physical health as well.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Being told that you have diabetes, or are pre-diabetic can be a cause of worry and dread. But by implementing these basic but powerful lifestyle changes, you can continue leading your life as normal, be healthy and even enjoy the occasional sweet treat!</p>\r\n\r\n<p><br />\r\n&nbsp;</p>', 'f54535c34910b91c68da99ceb8d75708007b2f8d.jpg', '', '', '', '', '', '2020-11-18 17:45:26', '2020-11-21 19:14:15', 'No', 'Active'),
(14, 3, 'Food Cravings: What They Mean & How to Manage Them', 'What They Mean', '<p>We&#39;ve all experienced cravings for certain foods at odd times during the day. It usually hits in the evening at around tea time, or late at night. Sometimes just a bite or two of that food is enough to fulfil the craving, at other times it&#39;s uncontrollable!</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Craving a particular food is not just about your desire to eat it. From possible nutritional deficiencies to your emotional and mental health, the science behind cravings is not as simple as you may think. Knowing the triggers can be invaluable in managing your cravings so that you can satisfy them while still sticking to your healthy eating plan.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>What Causes Cravings</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong><em>1. Nutritional deficiencies</em></strong></p>\r\n\r\n<p>Deficiencies in essential micronutrients can confuse your brain into thinking that you want to eat some indulgent foods; when what you actually need is a wholesome diet that addresses all your nutritional needs.&nbsp;</p>\r\n\r\n<p>Craving salty chips? You could be low on sodium. Chocolate could mean a magnesium or Vitamin B deficiency. Peanut butter or deep-fried foods signify a lack of healthy Omega-3 fats from your diet.</p>\r\n\r\n<p>Knowing these triggers can help you plan your meals and supplements better. So instead of constantly fighting your cravings, you can avoid them entirely.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong><em>2. Emotional and mental stress</em></strong></p>\r\n\r\n<p>When you feel anxious, high amounts of the stress hormone cortisol are released into your bloodstream. When you&#39;re not able to manage your stress well, your brain starts craving some comfort to get a quick hit of dopamine or the &#39;feel-good&#39; hormone.</p>\r\n\r\n<p>When you find yourself craving comfort food in the form of baked foods like cookies, cakes and muffins, it could be your brain looking for some short-term relief from stress. This is also made worse by lack of good-quality sleep.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong><em>3. Dehydration</em></strong></p>\r\n\r\n<p>We tend to overestimate how much water we&#39;re drinking during the day. Since hunger and thirst signals originate from the same part of the brain, it&#39;s common to mistake cravings as actual hunger instead of thirst. That early evening craving for biscuits, chaat or pakode with your chai? Try drinking a big glass of water before indulging.&nbsp;</p>\r\n\r\n<p>The recommended intake for adults is 3 litres of water in one day, more if you have a very active job or do strenuous exercises. If you&#39;re unsure of how much water you&#39;re drinking, download a water tracker app or keep a count in your daily diary every time you finish a 500ml/1 litre bottle.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong><em>4. Boredom</em></strong></p>\r\n\r\n<p>We&#39;re not just talking about the general boredom of everyday life but of food. While we all know the many benefits of clean eating and following a wholesome diet, eating the same meals many days in a row can get boring. So it&#39;s no wonder that after 3 days of eating similar meals of rice, dal and salad, your brain starts dreaming of pizza!</p>\r\n\r\n<p>Think of your meal times as a treat for all your senses. Even if you meal prep for many days in a row, try and include as many different ingredients, spices, cuisines and textures as possible.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Tips for Managing Cravings</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong><em>If you&#39;re craving</em></strong>: ice cream</p>\r\n\r\n<p><strong><em>Try</em></strong>: frozen banana, mango or pineapple puree. Craving ice cream very often is a sign that you need longer, better quality sleep because your brain wants to feel relaxed and happy. So have 2-3 spoonfuls of a frozen fruit puree to satisfy your sweet tooth, keep your phone away and get into bed early!</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong><em>If you&#39;re craving</em></strong>: salty chips</p>\r\n\r\n<p><strong><em>Try</em></strong>: a handful of peanuts or grilled/air-fried sweet potato fries. Craving salty food also signifies a lack of sodium in your daily diet. Whole foods like beets and leafy greens help you get your sodium from nutritious sources.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong><em>If you&#39;re craving</em></strong>: spicy/sour foods like chaat</p>\r\n\r\n<p><strong><em>Try</em></strong>: bringing some variety into your meals, or having a sweet and sour drink like lemonade with some chaat masala. Healthier versions of Indian chaat and spicy Asian foods can easily be made at home and will help you fight the urge to order an indulgent snack from your favourite chaatwala!</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong><em>If you&#39;re craving</em></strong>: baked foods like cakes, muffins and cookies</p>\r\n\r\n<p><strong><em>Try</em></strong>: sweet fruits like apples and seasonal berries. Constantly craving carb-rich baked foods is a sign that you have some unresolved anxiety or stress. Make exercise, yoga and meditation a part of your daily routine to combat this.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong><em>If you&#39;re craving</em></strong>: a little bit of everything</p>\r\n\r\n<p><strong><em>Try</em></strong>: drinking a big glass of water. Add ice, lemon, ginger and any other flavouring to make it tastier. Craving any and all food too soon after a big meal is usually a sign of dehydration.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Giving in to your cravings occasionally and having a slice of pizza, a piece of chocolate or some potato chips is by no means unhealthy. But if you find yourself sitting with a tub of ice cream every night or fantasising about doughnuts throughout the day, it&rsquo;s time to take a closer look at your meals and lifestyle.</p>\r\n\r\n<p><br />\r\n&nbsp;</p>', '56e084914f698b04a6b07fc55dcfc0b82390beeb.jpg', '', '', '', '', '', '2020-11-18 17:47:51', '2020-12-18 16:07:28', 'No', 'Active'),
(15, 1, 'Protein-Rich Foods for Vegetarians & Vegans', '', '<p>If you are on a fitness journey and are making changes to your nutrition, the most common tip you must have heard is to pay special attention to your protein intake. And for good reason!</p>\r\n\r\n<p>Think of protein as the building blocks of the body - it strengthens your muscles and hair, makes your skin supple and bright, and keeps you full and energised throughout the day. It is also the most satiating macronutrient. Meaning you can eat a meal rich in protein with moderate amounts of carbohydrates and fat, and it will keep you fuller for longer while being lower in calories than the average meal. It&rsquo;s a win-win!</p>\r\n\r\n<p>Even though vegetarian and vegan protein sources are not considered as &lsquo;complete&rsquo; - since most of them do not have all the 9 essential amino acids - learning to combine different ingredients is vital in ensuring that you have a well-balanced diet.&nbsp;</p>\r\n\r\n<p>Below are some of the best vegetarian and vegan sources of protein:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>1) Dairy</strong>&nbsp;</p>\r\n\r\n<p><strong><em>Good for</em></strong>: Vegetarians</p>\r\n\r\n<p>Milk, curd, cheese and paneer are excellent sources of protein since they are animal food derivatives. Apart from being rich sources of protein, they also have valuable calcium and are sometimes fortified with Vitamin D. However, they are high in fat so limit your consumption and pair dairy products with fruits and veggies for a rounded meal.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong><em>Meal ideas</em></strong>:</p>\r\n\r\n<p>Breakfast - oatmeal with low-fat milk or yoghurt</p>\r\n\r\n<p>Lunch - chaas fortified with flax seed powder</p>\r\n\r\n<p>Dinner - paneer and vegetable stir fry. Avoid other carb sources like rice or chapati with this meal to make it low-calorie while being rich in healthy protein, fat and nutritious veggies</p>\r\n\r\n<p>Snack - 1 cube of cheese with fruits like apple and pear</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>2) Lentils&nbsp;</strong></p>\r\n\r\n<p><strong><em>Good for</em></strong>: vegetarians and vegans</p>\r\n\r\n<p>A staple of the Indian diet, dals (lentils) are protein powerhouses while being versatile, filling and delicious! Make classic lentils like chanal dal, moong dal, masoor dal and toor dal a part of your daily diet. Apart from being rich in protein, they are also high in fibre, and so, very filling. Eat your dals with a teaspoon of ghee, a small portion of rice and a simple vegetable salad on the side, and you&#39;ve got yourself the perfect meal!</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong><em>Meal ideas</em></strong>:</p>\r\n\r\n<p>Breakfast - moong dal dosa with tomato &amp; onion chutney</p>\r\n\r\n<p>Lunch - spinach chana dal with rice and vegetable raita</p>\r\n\r\n<p>Dinner - toor dal &amp; rice khichdi with kachumber salad&nbsp;</p>\r\n\r\n<p>Snack - yellow moong dal dhokla with mint chutney</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>3) Beans</strong></p>\r\n\r\n<p><strong><em>Good for</em></strong>: vegetarians and vegans</p>\r\n\r\n<p>Beans like chole, rajma and kala chana are your best friends if you&#39;re on a diet plan to lose weight but want to eat satisfying and nutritious meals. Not only are they easy to cook and delicious, but they have also been found to reduce the risk of heart disease, improve insulin sensitivity in people with diabetes/PCOS and are high in gut-healthy fibre. Soak beans for at least 8 hours before cooking, and pair them with curd and some rice or chapati to make digestion easier, and to avoid feeling bloated.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong><em>Meal ideas</em></strong>:</p>\r\n\r\n<p>Breakfast - besan (chickpea flour) chilla with mint chutney</p>\r\n\r\n<p>Lunch - chole salad with boiled chole, onion, tomato, capsicum and coriander, with a drizzle of lemon juice, salt and pepper. Pair with some curd</p>\r\n\r\n<p>Dinner - rajma masala with chapati and chaas</p>\r\n\r\n<p>Snack - kala chana chaat with onion, tomato, coriander, salt and lemon juice</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>4) Quinoa</strong></p>\r\n\r\n<p><strong><em>Good for</em></strong>: vegetarians and vegans</p>\r\n\r\n<p>Quinoa is one of the rare vegan sources that is a complete protein, that is, it has all the 9 essential amino acids! With its nutty taste and chewy texture, it is the perfect replacement for rice in recipes like pulao, khichadi and even upma. What&#39;s more, it&#39;s gluten-free! Quinoa is also very rich in fibre, even more than some grains, and so makes the perfect ingredient for a meal high in nutrition as well as flavour.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong><em>Meal ideas</em></strong>:</p>\r\n\r\n<p>Breakfast - quinoa upma</p>\r\n\r\n<p>Lunch - vegetable pulao (with quinoa instead of rice) and raita</p>\r\n\r\n<p>Dinner - curd quinoa with pickle and roasted papad</p>\r\n\r\n<p>Snack - vegetable and quinoa patties with mint &amp; chilli chutney</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>5) Green Peas</strong></p>\r\n\r\n<p><strong><em>Good for</em></strong>: vegetarians and vegans</p>\r\n\r\n<p>Green peas are an underrated source of vegan protein and are also rich in fibre and antioxidants. Making them a regular part of your diet can help in reducing your risk of heart disease and certain cancers. Technically a part of the legume family, green peas are rich in Vitamins A, K and C. Some people complain of bloating after eating a large serving, so it&#39;s important to pair them with a moderate amount of carbs like rice or chapati and some fat like ghee, to make it easier for your body to digest it.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong><em>Meal ideas</em></strong>:</p>\r\n\r\n<p>Breakfast - green peas upma</p>\r\n\r\n<p>Lunch - peas paratha with curd</p>\r\n\r\n<p>Dinner - peas pulao with vegetable raita</p>\r\n\r\n<p>Snack - green peas kebab with mint chutney</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>6) Seeds</strong></p>\r\n\r\n<p><strong><em>Good for</em></strong>: vegetarians and vegans</p>\r\n\r\n<p>Seeds like pumpkin, chia, sunflower, flax and sesame are great sources of protein and add an interesting layer of flavour and texture to food. Apart from protein, most of them also have healthy fats (flax seeds supplements are the best replacement for Omega-3 fish oil capsules!). This also means that they are best had in small quantities, as an added layer of flavour to food.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong><em>Meal ideas</em></strong>:</p>\r\n\r\n<p>Breakfast - pumpkin seeds added to oatmeal</p>\r\n\r\n<p>Lunch - toasted and powdered flax seeds added to chaas</p>\r\n\r\n<p>Dinner - sesame seeds sprinkled over a vegetable stir fry</p>\r\n\r\n<p>Snack - chia seeds added to a fruit smoothie</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>7) Protein Supplements</strong></p>\r\n\r\n<p>If you are on a vegetarian or vegan diet plan and do strenuous exercises or have certain fitness goals, a protein supplement may be a good option. While all the foods listed above are great sources of protein, you would need to eat large quantities to get the same amount of protein that you would get from eggs, fish or meat.&nbsp;</p>\r\n\r\n<p>While a protein supplement is in no way necessary for a regular person following a healthy diet, you may consider this as an option if you have specific fitness goals, or are deficient in protein.</p>\r\n\r\n<p>It is also a misconception that having a protein supplement every day could affect the health of your kidneys. If you stick to the recommended daily amount, follow a balanced diet every day and keep yourself hydrated, it can be an amazing addition to your diet.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong><em>Vegetarian source</em></strong> - whey protein. Whey is simply the liquid part that separates from milk during cheese production. Whey protein powders can be had just with water as a shake or can be used to bulk up your oatmeal or smoothie.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong><em>Vegan source</em></strong> - pea protein and soy protein are the most common types of vegan protein supplements. Like whey, it can be had as a shake with water but some people may experience uncomfortable bloating when had on its own. Add a scoop to oatmeal or a fruit smoothie, to make it easier for your body to digest it.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>As you can see, it is a misconception that vegetarians and vegans lack protein in their diets. In fact, you are spoiled for choice! Try out new recipes, get creative and eat your protein through delicious meals.</p>\r\n\r\n<p><br />\r\n&nbsp;</p>', 'e06409f85864db7fc5f44a287b042d343f3fb211.jpg', '', '', '', '', '', '2020-11-18 17:53:18', '2020-11-21 19:13:43', 'No', 'Active'),
(16, 2, 'Causes of Acidity & 13 Home Remedies & Lifestyle Changes', '', '<p>We are all familiar with the uncomfortable feeling of acidity - burning in the stomach and chest, constant belching, feeling hungry but not being able to eat, bad taste in the mouth, restlessness and more. Sometimes a quick fix like an antacid is enough to calm the stomach, but when it starts becoming a regular part of your week, you need to think of long-term solutions.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>What is acidity?</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>When you eat food, your stomach produces acids that break down the food so that it is easier for your body to assimilate nutrients. Certain foods, medications and an unhealthy lifestyle create havoc in your body, causing the stomach to produce more acid than is required.</p>\r\n\r\n<p>This acid fills your stomach and flows back up towards your throat through the oesophagus, or &#39;food pipe&#39; and causes an uncomfortable burning sensation.</p>\r\n\r\n<p>When you start experiencing acidity more than twice a week, it is termed as GERD - &#39;Gastroesophageal Reflux Disease&#39; or &#39;Acid Reflux Disease&#39;. In these chronic cases, it can affect your entire body. Headaches, joint pain, nausea, dry cough and even vomiting are common symptoms.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>What causes acidity?</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong><em>1) Improper eating habits</em></strong></p>\r\n\r\n<ul>\r\n	<li>Not eating for a long time in between meals&nbsp;</li>\r\n	<li>Having a large meal all at once</li>\r\n	<li>Sleeping right after a big meal</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong><em>2) Foods</em></strong></p>\r\n\r\n<ul>\r\n	<li>Eating food that is too spicy, oily or salty</li>\r\n	<li>Certain foods like citrus fruits, tomato and garlic</li>\r\n	<li>Dairy products like milk, cheese and chocolate. This could also be a sign that you are lactose intolerant</li>\r\n	<li>Too much junk or processed food like chips, fried snacks and pizza with a lot of cheese</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong><em>3) Beverages</em></strong></p>\r\n\r\n<ul>\r\n	<li>Too many cups of tea and coffee, or drinking them strong without adding milk</li>\r\n	<li>Carbonated drinks</li>\r\n	<li>Too much alcohol</li>\r\n	<li>Drinking lemon water or apple cider vinegar on an empty stomach in the mornings. Although this is a common home remedy to cure acidity, it does not suit everyone and can make the problem worse</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong><em>4) Lifestyle habits</em></strong></p>\r\n\r\n<ul>\r\n	<li>Smoking</li>\r\n	<li>Not being active or exercising</li>\r\n	<li>Being overweight or obese</li>\r\n	<li>Stress and long-term anxiety can wreak havoc on your stomach and lead to chronic acidity</li>\r\n	<li>Certain over-the-counter anti-inflammatory medicines that contain ibuprofen, antibiotics, muscle relaxers, anti-depressants and blood pressure medications</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>13 Home Remedies &amp; Lifestyle Changes to Improve Acidity Symptoms</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>1) Buttermilk or chaas is your best friend! Have a tall, cool glass of buttermilk after your meal. Plain curd had with or after food also works well to soothe the stomach</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>2) Lemon water can be a great digestive, but you need to time it properly with a meal so that it does not make your acidity worse. Drink a glass of lemon juice at least half an hour before a big meal.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>3) Ginger is a superfood when it comes to acidity and digestive issues. Add grated ginger to your meals and pre-meal lemon water to aid digestion. If you can handle the taste, chew on a piece of ginger after your meal. This is especially helpful when you experience nausea caused by acidity</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>4) Cumin works very well to calm your stomach. Boil a few seeds in a glass of water the night before, and drink it first thing in the morning to avoid feeling bloated throughout the day</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>5) Dehydration could be the cause of your acidity and you might not even know it. Drink at least 2.5 to 3 litres of water a day. A glass of lukewarm water after a big meal also helps</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>6) Fruits like watermelon, musk melon and banana are known to help calm your stomach, so always keep them handy as mid-meal snacks</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>7) Include a simple salad of cucumber, carrot and curd with your big meals. Your stomach will thank you for the fibre!</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>8) If you have busy workdays, keep healthy snacks like fruits, nuts, buttermilk and cucumber or carrot sticks handy to have in between meals. Going more than 4-5 hours between meals can cause acidity, which becomes worse if you then eat lots of food at once</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>9) Make daily exercise a way of life. Being in a healthy weight range and being active throughout the day works wonders for your stomach</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>10) If you smoke, the best time to quit is now! Besides all the other negative effects it has on health, it is one of the leading causes of chronic hyperacidity</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>11) Eat your last meal at least two hours before sleeping. Always use a pillow to keep your head elevated when you sleep, to avoid having acid reflux at night</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>12) Stress and anxiety are an often-ignored cause of acidity. The mind has a powerful effect on the body, so managing stress through mindful practices like yoga, meditation and regular exercise helps eliminate acid reflux, bloating and stomach pain</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>13) If you are on any medication and think that is the cause of your acidity, always ask your doctor for an alternative, or to prescribe an antacid for the duration of the dosage. Avoid taking over-the-counter antacid medication too often, as it could weaken your stomach&rsquo;s response and even cause changes in metabolism</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Your body is a well-oiled machine. So giving it fuel in the form of balanced meals, strength through regular exercise and peace with mindful practices is the best way to ensure that your stomach is happy and healthy, and chronic acidity is a thing of the past!</p>\r\n\r\n<p><br />\r\n&nbsp;</p>', 'fcfa7aa73ff13633650de62d9e4c61935089285f.jpg', '', '', '', '', '', '2020-11-18 18:01:05', '2020-11-21 19:13:15', 'No', 'Active');
INSERT INTO `blog` (`id`, `category_id`, `blog_title`, `link`, `blog_description`, `image`, `meta_title`, `meta_keywords`, `meta_description`, `image_title`, `image_description`, `created_at`, `updated_at`, `is_deleted`, `status`) VALUES
(17, 3, 'How Nutrition Affects Mental Health', 'How Nutrition Affects', '<p>The essence of the entireness of our day banks on the resolution of what we embrace to eat. Nutrition impacts directly the wellness of our mental health and the quality of life we aspire to live. As mind-numbingly tedious as it may seem but keeping track of your nutrition could do wonders for your mental stability and improve your outlook of life.&nbsp;</p>\r\n\r\n<p>Nutrition is the stepping stone towards a healthy lifestyle. It not only keeps your weight in check but also drastically reduces your risk of chronic diseases such as diabetes and heart disease. It also plays a crucial part in controlling and maintaining disorders like anxiety and depression.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Depression and Anxiety</strong></p>\r\n\r\n<p>Depression is a chronic disease and millions of people are affected by it every year. There is no particular way to fight this everlasting battle against it but lifestyle remedies like maintaining a healthy diet sure give you a fighting chance. A recent 2017 study has shown that people suffering from a mild form of depression showed significant signs of improvement when subjected to a healthy diet over the course of 12 weeks. The improved diet weeded out refined sugar and unsaturated fats and focused highly on fresh foods rich in nutrients.</p>\r\n\r\n<p>Maintaining a proper diet balanced with the right amount of carbohydrates, proteins, fats, vitamins, and minerals can help overcome the deathly claws of depression. Especially, diets rich in carbohydrates can uplift your spirits on the other hand a low carbohydrate diet kills your vibe and can potentially make you cranky and unsatisfied.</p>\r\n\r\n<p>Infact, stress eating to make yourself feel better could worsen things and make your journey towards recovery even more long and complicated. Researchers have found an astonishing amount of evidence in favor of the concept that an unhealthy, unbalanced diet has the capacity of worsening your mood. Diets high in refined sugar allegedly aid in the promotion of stress and inflammation</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Strategies to incorporate a healthy lifestyle</strong></p>\r\n\r\n<p>Now that we understand how impactful good nutrition is on our mental health, it is important for us to know a few good dietary strategies to aid you in boosting your mood with food. The following are some of the ways you can do that:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>● Stabilizing the body&rsquo;s blood sugar levels​: Blood sugar levels are highly troublesome to maintain on a balanced diet, let alone a normal routine. Eating anything and everything could imbalance the hormones and can make you depressed, anxious, or cranky. To keep them on track, consume as many carbohydrates, fiber, and proteins as possible.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>● Consumption of good fats​: Contrary to popular belief, fats are quite essential for the nervous system. After all, our brain is 60% fat. It helps in supporting the function of the brain and reduces inflammation.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>● Make vitamin B a necessity​: Vitamin B does wonders for your body. It supports the nervous system and helps in stress management.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>● Get adequate sleep​: Multiple studies have shown that even the slightest inconvenience in sleep could make a person moody and cranky. People who get inadequate sleep have reported feeling more angry, mentally exhausted, and tired.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Green vegetables are deemed to be a vital source of vitamin B which has a direct effect on our mood. To aid in boosting your mood, you can add a few food items in your diet. These items include spinach, artichokes, okra, edamame, lentils, turnip greens, broccoli, and avocado. Food rich in fiber, good fats, and nutrients helps soothe the blood sugar levels of our body. These include strawberries, apples, nuts, oats, and citrus fruits.</p>\r\n\r\n<p>Good nutrition is excellent for the body and great for the brain. It plays a substantial role in the way we live our lives and keeps a hold on our emotions. There is high urgency to adopt a healthy lifestyle to improve the quality of our lives and we have all the evidence we need to take the leap towards that goal.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><br />\r\n&nbsp;</p>', '2dfc5fca858531ac312dcd4e16d148cdbf725d33.jpg', '', '', '', '', '', '2020-11-19 10:38:29', '2020-12-18 16:06:34', 'No', 'Active'),
(18, 3, 'Nutrition: Nutrients and the Role of the Dietitian and Nutritionist', 'Nutrients and the Role of the Dietitian', '<p>It is not uncommon for people to look for the need of a dietitian or a nutritionist. Before we get into the benefits they offer to our society, it is of utmost importance to know what nutrition truly is. It can be defined as the study of nutrients in food and how they are used by the body.</p>\r\n\r\n<p>Nutrition as a concept also dives into the complexities and risks of diseases and how we can make choices based on our diets to limit that danger. It also consists of systematic studies analyzing the effects on a body when it is exposed to too little or too many nutrients. Fiber, proteins, fat, carbohydrates, and vitamins are all categorized as nutrients and they help in providing the nourishment to our body needs.</p>\r\n\r\n<p>Nutritionists and Dietitians are experts in the field of nutrition and help in promoting a healthy lifestyle. They evaluate the health of their clients based on their findings and advise them on what foods to eat. They also provide individual-specific information to the clients suffering from a particular condition and help them get through it.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Role of Dietitians and nutritionists:</strong></p>\r\n\r\n<p>The focus of nutritionists and dietitians is on the objectives to provide proper guidance and develop proper nutrition based diets with respect to that person&rsquo;s requirements and needs.</p>\r\n\r\n<p>They share their expertise to advise individuals to either achieve a health-related goal or walk them through the tough road towards a healthy and stable lifestyle. They are spread across many fields, helping people from schools, hospitals, or even nursing homes. The first and arguably the most important agenda that they focus on is to help people make better and healthy food choices. The following are some of the other duties that dietitians and nutritionists have:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>They are highly influential in amending and proposing healthy lifestyle changes.&nbsp;</li>\r\n	<li>Come up with fresh nutrition programs and contribute to educating and spreading awareness among the students, adults, sports person, or a pregnant lady.</li>\r\n	<li>Providing their assistance in managing the healthy lifestyle that is also unique to an individual&rsquo;s own body type.</li>\r\n	<li>To head over to a nutritionist who can help guide better to lead a healthy lifestyle.</li>\r\n	<li>Oversee and create dietary plans for individuals with health conditions including heart diseases, allergies, cancer, and diabetes.</li>\r\n	<li>Analyze and clarify the capabilities of nutrition and what it can potentially do for an individual.&nbsp;</li>\r\n	<li>Assess and develop a diet according to the needs and necessities of the client.</li>\r\n	<li>They are also responsible for developing meal plans taking into consideration the health and cost needs of the client.&nbsp;</li>\r\n	<li>Keep evaluating and changing meal plans in accordance with the effects they have had on the client.</li>\r\n	<li>Be the advocate for nutrition and diet by talking about their relationship and promoting good eating habits.</li>\r\n</ul>\r\n\r\n<p>Nutritionists and dietitians are capable of making a huge positive impact on the lives of many individuals with health problems. With their expertise in the complexities of the human body, they can reduce health risks significantly and can improve an individual&rsquo;s quality of life.</p>', '6f4d8c1dbd3e7aed3b782d36b7fd12129328e7a9.jpg', '', '', '', '', '', '2020-11-19 10:41:16', '2020-12-18 16:05:59', 'No', 'Active'),
(19, 3, 'Some Amazing Books on Nutrition', '', '<p>It&rsquo;s entirely out of our hands to control genetics but what we let ourselves eat is very much in our control. Admittedly, we are humans at the end of the day, creatures of desires and cravings, brimming with passion but we are the architects of our own journeys. Amidst all the distractions and perplexity, we face a formidable task of surviving this rain of terror fast food and refined sugar has havocked on us all. The following are some amazing books to walk us through this quest for nutrition:-</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>How not to Die (Michael Greger)</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>This New York Times bestseller is a great help to those with the potential for illness. This groundbreaking book speaks wonders about the scientific evidence backing the diet that prevents several causes for diseases. In this highly informative book, Dr. Michael Greger talks in detail the top fifteen causes of death in America that happen prematurely. It contains a detailed&nbsp;breakdown of the diet you should follow in order to avoid the knock on the door of premature death.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Sleep Smarter (Shawn Stevenson)</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Whenever the physicians and enthusiasts harangue about the betterment of health, the importance of sleep is criminally overlooked. In his best selling book, Shawn Stevenson has shared his learnings on the matter after his life-changing, dream-crushing degenerative bone disease. Gaining wisdom from his own life experience, he describes in his book all the tips and tricks he picked up along the way towards a healthy lifestyle. With his guidance and systematic 2-week programs, you will learn to regulate your circadian rhythms by hacking sunlight. You will learn to create a better sleep schedule and stress reduction exercises.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Fortify your Life (Tieraona Low)</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>If your curiosity sparks your interest in how supplement fits into your nutrition, physician Tieraona Low in her book, fortifies your life, walks you through the modern era&rsquo;s guide to common nutrient deficiencies. She not only impressively educates us about the supplement industry but also shares the specific benefits of them.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Deep Nutrition (Catherine Shanahan)</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Bestowing a detailed perception of our ancestral diet, this best selling book of 2017 gives us a guide towards a healthy, disease-free life. With her astonishing knowledge in the field of health science, Dr. Catherine Shanahan devised a four nutrition strategy plan. This method forms the basis of &ldquo;The Human Diet&rdquo;, as she calls it, consisting of Sprouted foods, meat roasted on the bone, fresh foods, and organ meats. Dr. Cate shows us how we are not controlled by our genetics but we are the master of our own bodies.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>In Defence Of Food (Michael Pollan)</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Famous Journalist and writer, Michael Pollan, openly and truthfully criticizes the industrialization of health in the food business. He sheds some light on the awful neglect of natural fresh foods and the adoption of food science and diets. He also tackles the problem of the single nutrient philosophy sucking the joy out of healthy eating and taking away the enjoyment it is capable of offering. He advocates the neglection of the modern diet and adopting to eat real food instead.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>The obesity Code (Jason Fung)</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Obesity has dug its claws so deep in every household around the globe that it has become an epidemic we must not take lightly. In his book, Dr. Jason Fung focuses mostly on the hormonal effect on our weight loss and health rather than nutrition specifically. In addition to a guide towards effective weight loss and nutrition, he educates the reader about all the wonders there is in adopting the intermittent fasting diet.</p>\r\n\r\n<p><br />\r\n&nbsp;</p>', '47e608c75cf4d1ef0b8ca713fbd156f42706fbd5.jpg', '', '', '', '', '', '2020-11-19 10:44:32', '2020-11-19 10:44:32', 'No', 'Active'),
(20, 3, 'The Importance of Good Nutrition', '', '<p>What you choose to eat decides the essence of the entirety of your day. Nutrition has a direct impact on the quality of your life and your most precious well being. Food is not just about satisfying the urge of hunger, its paramount purpose is to provide nourishment to your body. Keeping track of what you eat might sound tedious at the beginning but it&rsquo;s the right step towards a nutritious and healthy lifestyle.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>What is good nutrition?</strong></p>\r\n\r\n<p>Finding the balance with good nutrition is not a big task as people might assume. You just need to make peace with it. If we go slowly and steadily with the whole process of good nutrition, it can easily be achieved. The crux of good nutrition is the combination of vitamins, nutrients, and minerals in your everyday meals. It includes eating a fair amount of fruit and vegetables while taking a haircut on all the delightful luscious snacks we all enjoy so much.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Why is Nutrition important?</strong></p>\r\n\r\n<p>To quote Dwayne &lsquo;The Rock&rsquo; Johnson,&rdquo; Nutrition is so important, it can&rsquo;t be stressed enough.&rdquo; The following are some of the reasons why we hold nutrition and a healthy lifestyle in such high esteem:-</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Shields away diseases:</strong><br />\r\n	Nutrition gives our body the right tools and strength to win its battles against the countless forms of diseases the outside world has to offer such as heart attacks, diabetes, and many more. It could help to reduce the risk of catching diseases that could severely harm your health and leave you vulnerable. According to recent studies, 80% of people have recovered from illness just by following a regular and a healthy diet. More than 80% of people diagnosed with cancer recovers just by following a healthy and regular diet. For diabetes, 1 in every 3 patients get cured by following a regular and healthy diet. So, if you take proper nutrition, you can easily shield away diseases.</li>\r\n	<li><strong>Dodging The Claws Of Obesity:</strong><br />\r\n	According to WHO, at least 2.8 million people suffer a horrible death primarily from being obese or overweight. It has become an epidemic since the &rsquo;70s and it cannot be stressed enough that we have to take substantial measures to prevent it. Nutrition is not only the right way out, it&rsquo;s the most natural one.</li>\r\n	<li><strong>Healthy Skin:</strong><br />\r\n	According to healthline.com, to make sure that the skin remains ever so soft and pleasing, we should intake an abundance of vitamins such as D, C, E, and K. Vitamin D alone does wonders for our health care when it comes to skin. It also saves us from unwelcomed grasps of skin cancer and sun damage with antioxidants and vitamins to fight them off.</li>\r\n	<li><strong>The Immune System:</strong><br />\r\n	When you eat healthily it doesn&rsquo;t just help you maintain the type of body you desire but it also assists in building up your immune system immensely. It cannot be stressed enough the immune system is the cavalry of our body, keeping the outside nuisances from affecting our body effectively. Good nutrition helps to strengthen the defense system of our body and aids us all the way through.</li>\r\n	<li><strong>Energy:</strong><br />\r\n	Food is the major source of energy our body has. It&rsquo;s the fuel that helps us function without falling off. Eating protein-rich products and healthy carbohydrates boost up our systems and give us a prolonged period of intensity and freshness.</li>\r\n	<li><strong>Increases Focus And Reforms Your Mood:</strong><br />\r\n	What&rsquo;s inside our belly can really affect the way we think. If the brain is not getting sufficient power and energy to function at its peak, losing focus is expected. Unhealthy fats and unsupervised.</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Eating habits can actually neurologically affect your brain in a bad way. The cheat code to a healthy brain is introducing a lot of fruit into your body and keeping that energy flowing. Moreover, diets rich in carbohydrates can uplift your mood and spirits whereas a low carbohydrate diet could very well make you unpleasant and cranky.</p>\r\n\r\n<p>Nutrition plays a vital role in our lives and the sooner we accept the urgency to adopt it in our routine the better. It is a way towards a better life. So think long and hard whether you really want to wake up every morning with all the promise that the crack of dawn conveys and not give yourself and your body what it truly deserves.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>', '7801aaaf4e0b733c6187caeb47292527580e9de0.jpg', '', '', '', '', '', '2020-11-19 10:46:34', '2020-11-20 13:34:41', 'No', 'Active'),
(21, 3, 'Why are Healthy Snacks Important?', '2021 Why are & Healthy Snacks Important', '<p>Dieting can often be mind-numbingly tedious. It can be awfully difficult to maintain and even harder to restart over and over again. What might help to tip the scales a bit in your favor is some good old snacking. It can be an integral part of a healthy diet. The nutrients that you might be missing in the diet that you are pursuing, those gaps can be filled by healthy snacking. It not only fulfills the purpose of nourishment in your body but also and most importantly aids in the management of hunger in between meals. The following are some benefits of healthy snacking:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Weight control:</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>The more we let ourselves starve the more likely we are to eat something drastically unhealthy. In order to avoid such cases, many dieticians recommend multiple small meals at an interval of 3 to 4 hours rather than the good old fashioned 3 meal routine. Keeping small meals could be a tenacious task since we are used to eating big meals. Another advantageous way to avoid extreme hunger is to keep healthy snacks around at all times, making it easier to suppress the cravings.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Managing cravings:</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Every individual experiences awkward cravings. Cravings and urges to eat junk food will wash away quickly if you start opting for healthier snacking options. You can get this going by adopting some healthy snacking habits that work best for you.</p>\r\n\r\n<p>What healthy snacking brings most to the table is its ability to not let your blood sugar drop and keep your metabolism in control. To escape from the claws of cravings and refined sugar, foods rich in a high fiber, nutrients, and proteins are what you should focus on. Fruits, nuts, and vegetables are packed with the necessary nutrients and they help you fight off the cravings.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Reforming mood and energy:</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Food is the fuel to our body. What we eat defines how we are going to process our day. Poor nutrient and high sugar diet may give you a refresher bump for a while but it leaves you with nothing but crankiness, sleepiness, and even more hunger. Healthy snacks on the other hand arms you with the right parts and keeps you going fresh all day long. Foods like cookies and soda give you a quick high and then push you even further down whereas fruits, grains, and vegetables are a godsend and an energy booster.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Controls body sugar levels:</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>If you keep up with your diet and intake a consistent amount of nutrients each day, healthy snacking could considerably help you keep in check your blood sugar level. For people fighting the war against diabetes, a good grasp of your blood sugar levels could go a long way. Moreover, uncertain highs and lows in the blood sugar levels make you prone to type 2 diabetes, heart diseases, and obesity over time which could very well be prevented by adopting healthy snacking.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Maintains Nutrition:</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>It is important to know that when snacking is introduced in diet programs it is not a license to go to town on the high sugar snacks and processed food. The major purpose of the addition of snacking in diets is to be the anchor between meals and fend off extreme hunger and to provide extra nutrients missing from your meals. Your snacks should majorly consist of nutrient-rich foods like vegetables, nuts, and fruits, although it is ok to have a not so healthy snack once in a while. Avoid snacking out of boredom at all costs and only resort to it when you are truly hungry.</p>', '01e80880b6514b0185a1a54e6208730fcf96e363.jpg', '', '', '', '', '', '2020-11-19 10:47:53', '2020-12-19 17:18:52', 'No', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_deleted` enum('No','Yes') NOT NULL,
  `status` enum('Active','Inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`, `is_deleted`, `status`) VALUES
(1, 'Lifestyle Hacks', '2020-10-20 18:20:51', '2020-10-20 18:20:51', 'No', 'Active'),
(2, 'Disease Specific', '2020-10-20 18:21:33', '2020-10-20 18:21:33', 'No', 'Active'),
(3, 'Nutritional Knowledge', '2020-10-20 18:22:29', '2020-10-20 18:22:29', 'No', 'Active'),
(5, 'abc9999', '2020-12-16 14:55:12', '2020-12-16 14:55:37', 'No', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `blog_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` enum('Active','Inactive') NOT NULL,
  `is_deleted` enum('No','Yes') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `blog_id`, `name`, `email`, `created_at`, `updated_at`, `status`, `is_deleted`) VALUES
(1, 18, 'PgQvONeWZFHT', 'shellcooponeill@aol.com', '2020-12-02 11:31:33', '2020-12-02 11:31:33', 'Active', 'No'),
(2, 18, 'xqGkWMVsKlIHoA', 'shellcooponeill@aol.com', '2020-12-02 11:31:34', '2020-12-02 11:31:34', 'Active', 'No'),
(3, 18, 'VtdyBlYNRIe', 'cminpc@aol.com', '2020-12-02 13:16:46', '2020-12-02 13:16:46', 'Active', 'No'),
(4, 18, 'MXwLCpqJsjHQFygk', 'cminpc@aol.com', '2020-12-02 13:16:47', '2020-12-02 13:16:47', 'Active', 'No'),
(5, 18, 'KujXVFSC', 'sherrilyng@verizon.net', '2020-12-02 14:03:47', '2020-12-02 14:03:47', 'Active', 'No'),
(6, 18, 'NhCjgTaesMz', 'sherrilyng@verizon.net', '2020-12-02 14:03:49', '2020-12-02 14:03:49', 'Active', 'No'),
(7, 18, 'HRScoxyWkhXOb', 'nash.kelli@yahoo.com', '2020-12-02 14:39:57', '2020-12-02 14:39:57', 'Active', 'No'),
(8, 18, 'kNMBiLXOD', 'nash.kelli@yahoo.com', '2020-12-02 14:39:58', '2020-12-02 14:39:58', 'Active', 'No'),
(9, 18, 'CnBgWfkypKz', 'mfajr71@yahoo.com', '2020-12-02 14:41:52', '2020-12-02 14:41:52', 'Active', 'No'),
(10, 18, 'lDHgCGrKdIyxe', 'asoltani05@yahoo.com', '2020-12-02 15:14:02', '2020-12-02 15:14:02', 'Active', 'No'),
(11, 18, 'aIuMOJQzCWB', 'asoltani05@yahoo.com', '2020-12-02 15:14:04', '2020-12-02 15:14:04', 'Active', 'No'),
(12, 18, 'eumwVrhGOXlRNk', 'flojo30c@yahoo.com', '2020-12-02 16:42:21', '2020-12-02 16:42:21', 'Active', 'No'),
(13, 18, 'tViCHzQJufylEk', 'flojo30c@yahoo.com', '2020-12-02 16:42:26', '2020-12-02 16:42:26', 'Active', 'No'),
(14, 18, 'DgBLIdMqvSsik', 'benbrown09@bellsouth.net', '2020-12-02 17:11:30', '2020-12-02 17:11:30', 'Active', 'No'),
(15, 18, 'OjufVUNP', 'benbrown09@bellsouth.net', '2020-12-02 17:11:32', '2020-12-02 17:11:32', 'Active', 'No'),
(16, 18, 'LunCNpawh', 'smhyde0406@yahoo.com', '2020-12-02 17:20:13', '2020-12-02 17:20:13', 'Active', 'No'),
(17, 18, 'FinAhTIbY', 'smhyde0406@yahoo.com', '2020-12-02 17:20:15', '2020-12-02 17:20:15', 'Active', 'No'),
(18, 21, 'smEOzrnW', 'michmerk02@verizon.net', '2020-12-02 19:23:13', '2020-12-02 19:23:13', 'Active', 'No'),
(19, 21, 'uMifbwZX', 'michmerk02@verizon.net', '2020-12-02 19:23:14', '2020-12-02 19:23:14', 'Active', 'No'),
(20, 18, 'mdeMryTizuo', 'jerholen1@aol.com', '2020-12-02 20:54:52', '2020-12-02 20:54:52', 'Active', 'No'),
(21, 18, 'EPwDLnqZcRbi', 'jerholen1@aol.com', '2020-12-02 20:54:52', '2020-12-02 20:54:52', 'Active', 'No'),
(22, 18, 'MDlhatrYBUxbOKzE', 'tderr4117@aol.com', '2020-12-02 22:54:32', '2020-12-02 22:54:32', 'Active', 'No'),
(23, 18, 'OlbLrKfPdAmVZTyR', 'tderr4117@aol.com', '2020-12-02 22:54:34', '2020-12-02 22:54:34', 'Active', 'No'),
(24, 18, 'pnXWomRQ', 'bigoleary@yahoo.com', '2020-12-03 00:04:08', '2020-12-03 00:04:08', 'Active', 'No'),
(25, 18, 'vxDalmVH', 'bigoleary@yahoo.com', '2020-12-03 00:04:39', '2020-12-03 00:04:39', 'Active', 'No'),
(26, 18, 'SuTDnZsBmh', 'blancorojo@att.net', '2020-12-03 00:21:30', '2020-12-03 00:21:30', 'Active', 'No'),
(27, 18, 'opiUPcwbax', 'blancorojo@att.net', '2020-12-03 00:21:31', '2020-12-03 00:21:31', 'Active', 'No'),
(28, 18, 'xrUnAGcVbXKS', 'fenwick420@yahoo.com', '2020-12-03 00:38:44', '2020-12-03 00:38:44', 'Active', 'No'),
(29, 18, 'YgUzyZFRok', 'fenwick420@yahoo.com', '2020-12-03 00:38:46', '2020-12-03 00:38:46', 'Active', 'No'),
(30, 18, 'AkyphdIwgGnHXY', 'matthewrhershey@yahoo.com', '2020-12-03 01:02:43', '2020-12-03 01:02:43', 'Active', 'No'),
(31, 18, 'MCWXAGHaJFjS', 'matthewrhershey@yahoo.com', '2020-12-03 01:02:45', '2020-12-03 01:02:45', 'Active', 'No'),
(32, 18, 'bXUdrhIky', 'perry.lydia@ymail.com', '2020-12-03 02:45:06', '2020-12-03 02:45:06', 'Active', 'No'),
(33, 18, 'AdbyoHKmVEJi', 'perry.lydia@ymail.com', '2020-12-03 02:45:08', '2020-12-03 02:45:08', 'Active', 'No'),
(34, 18, 'uFQqmogDt', 'perry.lydia@ymail.com', '2020-12-03 02:48:09', '2020-12-03 02:48:09', 'Active', 'No'),
(35, 18, 'xulYrhNUvs', 'perry.lydia@ymail.com', '2020-12-03 02:48:11', '2020-12-03 02:48:11', 'Active', 'No'),
(36, 18, 'qzXlDmngJocsIpGU', 'a.farmer@yahoo.com', '2020-12-03 05:14:01', '2020-12-03 05:14:01', 'Active', 'No'),
(37, 18, 'OEXbvJYMtgpS', 'a.farmer@yahoo.com', '2020-12-03 05:14:03', '2020-12-03 05:14:03', 'Active', 'No'),
(38, 18, 'GkupneBzqOyjw', 'bancale1964@yahoo.com', '2020-12-03 06:10:40', '2020-12-03 06:10:40', 'Active', 'No'),
(39, 18, 'axfyZQhlCsWD', 'bancale1964@yahoo.com', '2020-12-03 06:10:43', '2020-12-03 06:10:43', 'Active', 'No'),
(40, 18, 'VohLHYnr', 'philipshepherd@att.net', '2020-12-03 08:11:09', '2020-12-03 08:11:09', 'Active', 'No'),
(41, 18, 'chFgUzVRbrGmS', 'philipshepherd@att.net', '2020-12-03 08:11:10', '2020-12-03 08:11:10', 'Active', 'No'),
(42, 18, 'XnpLRoQWMD', 'giberticori@yahoo.com', '2020-12-03 08:48:51', '2020-12-03 08:48:51', 'Active', 'No'),
(43, 18, 'gyHFmDnGiOSWbLqz', 'giberticori@yahoo.com', '2020-12-03 08:48:52', '2020-12-03 08:48:52', 'Active', 'No'),
(44, 18, 'XpDQBlMN', 'moffat_farm@yahoo.com', '2020-12-03 10:41:37', '2020-12-03 10:41:37', 'Active', 'No'),
(45, 18, 'qQGlZtuJ', 'moffat_farm@yahoo.com', '2020-12-03 10:41:39', '2020-12-03 10:41:39', 'Active', 'No'),
(46, 18, 'svfISKHhzy', 'tylerdonovan01052006@yahoo.com', '2020-12-03 12:42:15', '2020-12-03 12:42:15', 'Active', 'No'),
(47, 18, 'aHXvdJPhK', 'tylerdonovan01052006@yahoo.com', '2020-12-03 12:42:17', '2020-12-03 12:42:17', 'Active', 'No'),
(48, 18, 'KTGSAPJBwZr', 'louielulham@yahoo.com', '2020-12-03 14:23:22', '2020-12-03 14:23:22', 'Active', 'No'),
(49, 18, 'LkYerJwWGbZcUud', 'louielulham@yahoo.com', '2020-12-03 14:23:24', '2020-12-03 14:23:24', 'Active', 'No'),
(50, 18, 'fkJYFAtsG', 'lrainey1298@verizon.net', '2020-12-03 20:48:21', '2020-12-03 20:48:21', 'Active', 'No'),
(51, 18, 'GEtTHcANLQJFm', 'lrainey1298@verizon.net', '2020-12-03 20:48:23', '2020-12-03 20:48:23', 'Active', 'No'),
(52, 18, 'PykwHONDvLeEBn', 'claireabbe@aol.com', '2020-12-04 14:24:54', '2020-12-04 14:24:54', 'Active', 'No'),
(53, 18, 'DpeuNbay', 'claireabbe@aol.com', '2020-12-04 14:24:56', '2020-12-04 14:24:56', 'Active', 'No'),
(54, 18, 'tVFHTURol', 'shermans4728@aol.com', '2020-12-06 18:16:26', '2020-12-06 18:16:26', 'Active', 'No'),
(55, 18, 'QfIYeiTKyxcJ', 'shermans4728@aol.com', '2020-12-06 18:16:30', '2020-12-06 18:16:30', 'Active', 'No'),
(56, 21, 'RFmboXscJQOZKej', 'conshamyoov@gmail.com', '2020-12-06 23:10:33', '2020-12-06 23:10:33', 'Active', 'No'),
(57, 21, 'rENuRSAxjmDzQelU', 'conshamyoov@gmail.com', '2020-12-06 23:10:35', '2020-12-06 23:10:35', 'Active', 'No'),
(58, 18, 'yvhHLlrSjbtoO', 'emerita.levesongower@yahoo.com', '2020-12-07 19:01:08', '2020-12-07 19:01:08', 'Active', 'No'),
(59, 18, 'dSRwyOEXMKzgJ', 'browne_shawnta@yahoo.com', '2020-12-08 01:17:32', '2020-12-08 01:17:32', 'Active', 'No'),
(60, 18, 'SmFHvEacgd', 'browne_shawnta@yahoo.com', '2020-12-08 01:17:34', '2020-12-08 01:17:34', 'Active', 'No'),
(61, 18, 'CwIqNOzmUdjic', 'brigidstanley@yahoo.com', '2020-12-08 06:22:52', '2020-12-08 06:22:52', 'Active', 'No'),
(62, 18, 'kIztDjogbQKd', 'brigidstanley@yahoo.com', '2020-12-08 06:22:52', '2020-12-08 06:22:52', 'Active', 'No'),
(63, 18, 'awBoqXNi', 'weladia@yahoo.com', '2020-12-08 06:34:45', '2020-12-08 06:34:45', 'Active', 'No'),
(64, 18, 'SVcBRjTgO', 'weladia@yahoo.com', '2020-12-08 06:34:47', '2020-12-08 06:34:47', 'Active', 'No'),
(65, 18, 'TAEwtROjiBLkJCrS', 'shaundaclemy@yahoo.com', '2020-12-09 07:40:07', '2020-12-09 07:40:07', 'Active', 'No'),
(66, 18, 'exupqIZsw', 'shaundaclemy@yahoo.com', '2020-12-09 07:40:10', '2020-12-09 07:40:10', 'Active', 'No'),
(67, 18, 'TwIcvULl', 'simonesteele390@yahoo.com', '2020-12-10 15:38:04', '2020-12-10 15:38:04', 'Active', 'No'),
(68, 18, 'XwfnFEUTi', 'simonesteele390@yahoo.com', '2020-12-10 15:38:05', '2020-12-10 15:38:05', 'Active', 'No'),
(69, 18, 'iFqmjHMKtf', 'flemingfay9@gmail.com', '2020-12-14 16:05:03', '2020-12-14 16:05:03', 'Active', 'No'),
(70, 18, 'ltkFbeOsIyDXC', 'flemingfay9@gmail.com', '2020-12-14 16:05:05', '2020-12-14 16:05:05', 'Active', 'No'),
(71, 18, 'bmHzaNqBOiKovZk', 'anjaballantyne@yahoo.com', '2020-12-14 18:28:39', '2020-12-14 18:28:39', 'Active', 'No'),
(72, 18, 'KlTVwFQExZv', 'anjaballantyne@yahoo.com', '2020-12-14 18:28:41', '2020-12-14 18:28:41', 'Active', 'No'),
(73, 20, 'myJgbDUjFPphr', 'kaydora232@yahoo.com', '2020-12-14 19:09:03', '2020-12-14 19:09:03', 'Active', 'No'),
(74, 20, 'XfawqNiELu', 'kaydora232@yahoo.com', '2020-12-14 19:09:04', '2020-12-14 19:09:04', 'Active', 'No');

-- --------------------------------------------------------

--
-- Table structure for table `comments_reply`
--

CREATE TABLE `comments_reply` (
  `id` int(11) NOT NULL,
  `blog_id` int(11) NOT NULL,
  `comment_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `reply` text NOT NULL,
  `approve_status` enum('Disapprove','Approve') NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_deleted` enum('No','Yes') NOT NULL,
  `status` enum('Active','Inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comments_reply`
--

INSERT INTO `comments_reply` (`id`, `blog_id`, `comment_id`, `message`, `reply`, `approve_status`, `created_at`, `updated_at`, `is_deleted`, `status`) VALUES
(1, 18, 1, 'YgmDNrlIAtsVLu', '', 'Disapprove', '2020-12-02 11:31:33', '2020-12-02 11:31:33', 'No', 'Active'),
(2, 18, 2, 'qTuHFzamYQRB', '', 'Disapprove', '2020-12-02 11:31:34', '2020-12-02 11:31:34', 'No', 'Active'),
(3, 18, 3, 'nHvBScmstbgN', '', 'Disapprove', '2020-12-02 13:16:46', '2020-12-02 13:16:46', 'No', 'Active'),
(4, 18, 4, 'YXnicxmFe', '', 'Disapprove', '2020-12-02 13:16:47', '2020-12-02 13:16:47', 'No', 'Active'),
(5, 18, 5, 'ZpJsNDvl', '', 'Disapprove', '2020-12-02 14:03:47', '2020-12-02 14:03:47', 'No', 'Active'),
(6, 18, 6, 'jWTtMbQzhX', '', 'Disapprove', '2020-12-02 14:03:49', '2020-12-02 14:03:49', 'No', 'Active'),
(7, 18, 7, 'pBfuZAgX', '', 'Disapprove', '2020-12-02 14:39:57', '2020-12-02 14:39:57', 'No', 'Active'),
(8, 18, 8, 'oGYXCgmwIMuZL', '', 'Disapprove', '2020-12-02 14:39:58', '2020-12-02 14:39:58', 'No', 'Active'),
(9, 18, 9, 'WdvbEXqRINZFK', '', 'Disapprove', '2020-12-02 14:41:52', '2020-12-02 14:41:52', 'No', 'Active'),
(10, 18, 10, 'hLWViMcuTSQJl', '', 'Disapprove', '2020-12-02 15:14:02', '2020-12-02 15:14:02', 'No', 'Active'),
(11, 18, 11, 'NVceoPHpOvYifhkQ', '', 'Disapprove', '2020-12-02 15:14:04', '2020-12-02 15:14:04', 'No', 'Active'),
(12, 18, 12, 'YCWLFsrUoqanfQgM', '', 'Disapprove', '2020-12-02 16:42:21', '2020-12-02 16:42:21', 'No', 'Active'),
(13, 18, 13, 'rXAtFqxvRw', '', 'Disapprove', '2020-12-02 16:42:26', '2020-12-02 16:42:26', 'No', 'Active'),
(14, 18, 14, 'lrFqEgCB', '', 'Disapprove', '2020-12-02 17:11:30', '2020-12-02 17:11:30', 'No', 'Active'),
(15, 18, 15, 'moyHbhYlEuU', '', 'Disapprove', '2020-12-02 17:11:32', '2020-12-02 17:11:32', 'No', 'Active'),
(16, 18, 16, 'rbJOqMHSsyZh', '', 'Disapprove', '2020-12-02 17:20:13', '2020-12-02 17:20:13', 'No', 'Active'),
(17, 18, 17, 'vopTLPdKJXta', '', 'Disapprove', '2020-12-02 17:20:15', '2020-12-02 17:20:15', 'No', 'Active'),
(18, 21, 18, 'jDMSKmzdQp', '', 'Disapprove', '2020-12-02 19:23:13', '2020-12-02 19:23:13', 'No', 'Active'),
(19, 21, 19, 'aeGzdOHWfm', '', 'Disapprove', '2020-12-02 19:23:14', '2020-12-02 19:23:14', 'No', 'Active'),
(20, 18, 20, 'EmeKqHdnMUJajy', '', 'Disapprove', '2020-12-02 20:54:52', '2020-12-02 20:54:52', 'No', 'Active'),
(21, 18, 21, 'CWhHVpDyo', '', 'Disapprove', '2020-12-02 20:54:52', '2020-12-02 20:54:52', 'No', 'Active'),
(22, 18, 22, 'tzjhYivFrao', '', 'Disapprove', '2020-12-02 22:54:32', '2020-12-02 22:54:32', 'No', 'Active'),
(23, 18, 23, 'AWJckfNmoEynwq', '', 'Disapprove', '2020-12-02 22:54:34', '2020-12-02 22:54:34', 'No', 'Active'),
(24, 18, 24, 'wgHDPjCWcX', '', 'Disapprove', '2020-12-03 00:04:08', '2020-12-03 00:04:08', 'No', 'Active'),
(25, 18, 25, 'aKNOzuFSPcJd', '', 'Disapprove', '2020-12-03 00:04:40', '2020-12-03 00:04:40', 'No', 'Active'),
(26, 18, 26, 'mHgnKfpZir', '', 'Disapprove', '2020-12-03 00:21:30', '2020-12-03 00:21:30', 'No', 'Active'),
(27, 18, 27, 'poWAONMugtJYZC', '', 'Disapprove', '2020-12-03 00:21:32', '2020-12-03 00:21:32', 'No', 'Active'),
(28, 18, 28, 'ZeFiXMaPpIxmwf', '', 'Disapprove', '2020-12-03 00:38:44', '2020-12-03 00:38:44', 'No', 'Active'),
(29, 18, 29, 'PRDBQSYOILbfvJzl', '', 'Disapprove', '2020-12-03 00:38:46', '2020-12-03 00:38:46', 'No', 'Active'),
(30, 18, 30, 'WKMLmOCko', '', 'Disapprove', '2020-12-03 01:02:44', '2020-12-03 01:02:44', 'No', 'Active'),
(31, 18, 31, 'mcWvoPkausj', '', 'Disapprove', '2020-12-03 01:02:45', '2020-12-03 01:02:45', 'No', 'Active'),
(32, 18, 32, 'dUVatpbPnF', '', 'Disapprove', '2020-12-03 02:45:06', '2020-12-03 02:45:06', 'No', 'Active'),
(33, 18, 33, 'qhsWAXzudnCixHy', '', 'Disapprove', '2020-12-03 02:45:08', '2020-12-03 02:45:08', 'No', 'Active'),
(34, 18, 34, 'mlaQHbLD', '', 'Disapprove', '2020-12-03 02:48:09', '2020-12-03 02:48:09', 'No', 'Active'),
(35, 18, 35, 'ScmLNvXwRhBkCfF', '', 'Disapprove', '2020-12-03 02:48:11', '2020-12-03 02:48:11', 'No', 'Active'),
(36, 18, 36, 'LFkPypAUaB', '', 'Disapprove', '2020-12-03 05:14:01', '2020-12-03 05:14:01', 'No', 'Active'),
(37, 18, 37, 'RGfZhzQIKciSdq', '', 'Disapprove', '2020-12-03 05:14:03', '2020-12-03 05:14:03', 'No', 'Active'),
(38, 18, 38, 'BHMtRDnp', '', 'Disapprove', '2020-12-03 06:10:40', '2020-12-03 06:10:40', 'No', 'Active'),
(39, 18, 39, 'RkNbvytYMceAXmdH', '', 'Disapprove', '2020-12-03 06:10:43', '2020-12-03 06:10:43', 'No', 'Active'),
(40, 18, 40, 'zyTdCDcsYUpWGFl', '', 'Disapprove', '2020-12-03 08:11:09', '2020-12-03 08:11:09', 'No', 'Active'),
(41, 18, 41, 'nuCsxITAak', '', 'Disapprove', '2020-12-03 08:11:10', '2020-12-03 08:11:10', 'No', 'Active'),
(42, 18, 42, 'CUqThcbWHKMPe', '', 'Disapprove', '2020-12-03 08:48:51', '2020-12-03 08:48:51', 'No', 'Active'),
(43, 18, 43, 'SVThEOCa', '', 'Disapprove', '2020-12-03 08:48:52', '2020-12-03 08:48:52', 'No', 'Active'),
(44, 18, 44, 'vPgUGaiEuYL', '', 'Disapprove', '2020-12-03 10:41:37', '2020-12-03 10:41:37', 'No', 'Active'),
(45, 18, 45, 'mFWkZECo', '', 'Disapprove', '2020-12-03 10:41:40', '2020-12-03 10:41:40', 'No', 'Active'),
(46, 18, 46, 'IfwoWgDVRC', '', 'Disapprove', '2020-12-03 12:42:15', '2020-12-03 12:42:15', 'No', 'Active'),
(47, 18, 47, 'PckMorRpN', '', 'Disapprove', '2020-12-03 12:42:17', '2020-12-03 12:42:17', 'No', 'Active'),
(48, 18, 48, 'VkydbxQOAPFw', '', 'Disapprove', '2020-12-03 14:23:22', '2020-12-03 14:23:22', 'No', 'Active'),
(49, 18, 49, 'DokfxZuqr', '', 'Disapprove', '2020-12-03 14:23:24', '2020-12-03 14:23:24', 'No', 'Active'),
(50, 18, 50, 'zkUpEcjlMhNa', '', 'Disapprove', '2020-12-03 20:48:21', '2020-12-03 20:48:21', 'No', 'Active'),
(51, 18, 51, 'otTEsCIPHe', '', 'Disapprove', '2020-12-03 20:48:23', '2020-12-03 20:48:23', 'No', 'Active'),
(52, 18, 52, 'WrYDVOKJbjBFpTU', '', 'Disapprove', '2020-12-04 14:24:54', '2020-12-04 14:24:54', 'No', 'Active'),
(53, 18, 53, 'WrhZRTKt', '', 'Disapprove', '2020-12-04 14:24:59', '2020-12-04 14:24:59', 'No', 'Active'),
(54, 18, 54, 'GsNxqfCZDHwc', '', 'Disapprove', '2020-12-06 18:16:26', '2020-12-06 18:16:26', 'No', 'Active'),
(55, 18, 55, 'OfctEqisPHSvMTVe', '', 'Disapprove', '2020-12-06 18:16:30', '2020-12-06 18:16:30', 'No', 'Active'),
(56, 21, 56, 'IfdvUCpgQwX', '', 'Disapprove', '2020-12-06 23:10:34', '2020-12-06 23:10:34', 'No', 'Active'),
(57, 21, 57, 'TSozPhZxnJ', '', 'Disapprove', '2020-12-06 23:10:35', '2020-12-06 23:10:35', 'No', 'Active'),
(58, 18, 58, 'FxMrCqiRQTV', '', 'Disapprove', '2020-12-07 19:01:08', '2020-12-07 19:01:08', 'No', 'Active'),
(59, 18, 59, 'fgCdYRjJAUT', '', 'Disapprove', '2020-12-08 01:17:32', '2020-12-08 01:17:32', 'No', 'Active'),
(60, 18, 60, 'TkAvfQXanF', '', 'Disapprove', '2020-12-08 01:17:34', '2020-12-08 01:17:34', 'No', 'Active'),
(61, 18, 61, 'YfaoIHpgrMx', '', 'Disapprove', '2020-12-08 06:22:52', '2020-12-08 06:22:52', 'No', 'Active'),
(62, 18, 62, 'xWVsqMETeURi', '', 'Disapprove', '2020-12-08 06:22:52', '2020-12-08 06:22:52', 'No', 'Active'),
(63, 18, 63, 'DOKHqkidWJLGUNXA', '', 'Disapprove', '2020-12-08 06:34:45', '2020-12-08 06:34:45', 'No', 'Active'),
(64, 18, 64, 'TAtNYwvuph', '', 'Disapprove', '2020-12-08 06:34:47', '2020-12-08 06:34:47', 'No', 'Active'),
(65, 18, 65, 'IXrUaDFBwGVi', '', 'Disapprove', '2020-12-09 07:40:07', '2020-12-09 07:40:07', 'No', 'Active'),
(66, 18, 66, 'qFMxObeQaIcnRBAo', '', 'Disapprove', '2020-12-09 07:40:10', '2020-12-09 07:40:10', 'No', 'Active'),
(67, 18, 67, 'aZOIhHjpL', '', 'Disapprove', '2020-12-10 15:38:04', '2020-12-10 15:38:04', 'No', 'Active'),
(68, 18, 68, 'hUtKyrvQRHpcE', '', 'Disapprove', '2020-12-10 15:38:05', '2020-12-10 15:38:05', 'No', 'Active'),
(69, 18, 69, 'yznFgtdfRamrJj', '', 'Disapprove', '2020-12-14 16:05:03', '2020-12-14 16:05:03', 'No', 'Active'),
(70, 18, 70, 'GexcPoTlLq', '', 'Disapprove', '2020-12-14 16:05:05', '2020-12-14 16:05:05', 'No', 'Active'),
(71, 18, 71, 'cnHPygCIpsN', '', 'Disapprove', '2020-12-14 18:28:39', '2020-12-14 18:28:39', 'No', 'Active'),
(72, 18, 72, 'GSkIntRWoO', '', 'Disapprove', '2020-12-14 18:28:41', '2020-12-14 18:28:41', 'No', 'Active'),
(73, 20, 73, 'kYsZWyjOxodaApz', '', 'Disapprove', '2020-12-14 19:09:03', '2020-12-14 19:09:03', 'No', 'Active'),
(74, 20, 74, 'AtbhzJrSdgWKeE', '', 'Disapprove', '2020-12-14 19:09:04', '2020-12-14 19:09:04', 'No', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` enum('Active','Inactive') NOT NULL,
  `is_deleted` enum('No','Yes') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `name`, `email`, `subject`, `message`, `created_at`, `updated_at`, `status`, `is_deleted`) VALUES
(3, 'Testing1', 'pagarelaxmi@gmail.com', 'dad', 'sdd', '2020-09-03 07:06:50', '2020-10-26 14:54:07', 'Active', 'Yes'),
(4, 'Laxmi Pagare', 'webdeveloper@techrupt.in', 'asdads', 'asdasd', '2020-09-03 07:11:44', '2020-10-26 17:14:50', 'Active', 'Yes'),
(5, 'Vandana Pagare', 'webdeveloper@techrupt.in', 'Subject99', 'fdrgdgdg', '2020-10-26 12:41:10', '2020-10-26 12:41:10', 'Active', 'No'),
(6, 'Amira Dhivre', 'webdeveloper@techrupt.in', 'Subject99', 'yetuyieti', '2020-10-26 12:41:59', '2020-10-26 12:41:59', 'Active', 'No'),
(7, 'urvashi', 'webdeveloper@techrupt.in', 'Subject99', 'dgdgdgf', '2020-10-26 17:13:49', '2020-10-26 17:13:49', 'Active', 'No'),
(8, 'Laxmi Pagare', 'webdeveloper@techrupt.in', 'Testing', 'Testing', '2020-10-28 16:51:20', '2020-11-06 14:03:03', 'Active', 'Yes'),
(9, 'Laxmi Pagare', 'webdeveloper@techrupt.in', 'Testing', 'Testing', '2020-10-28 16:51:38', '2020-11-06 14:32:42', 'Active', 'Yes'),
(10, 'Laxmi Pagare', 'webdeveloper@techrupt.in', 'Testing', 'Testing', '2020-10-28 16:51:46', '2020-11-06 16:08:46', 'Active', 'Yes'),
(11, 'Laxmi Pagare', 'webdeveloper@techrupt.in', 'message', 'Testing', '2020-10-28 16:52:20', '2020-10-30 17:31:44', 'Active', 'Yes'),
(12, 'Laxmi Pagare', 'webdeveloper@techrupt.in', 'Testing', 'Want details.....', '2020-10-28 16:54:45', '2020-10-30 17:31:10', 'Active', 'Yes'),
(13, 'Laxmi Pagare', 'webdeveloper@techrupt.in', 'Testing', 'Want Details.......!', '2020-10-28 16:56:00', '2020-10-30 17:29:08', 'Active', 'Yes'),
(14, 'Laxmi Pagare', 'webdeveloper@techrupt.in', 'Testing', 'Want Details........!', '2020-10-28 16:56:52', '2020-10-30 17:28:54', 'Active', 'Yes'),
(15, 'Surendra', 'webdesigner@techrupt.in', 'No Testing', '', '2020-11-02 16:55:03', '2020-11-02 16:55:03', 'Active', 'No'),
(16, 'Urvashi', 'urvashitikmani1310@gmail.com', 'abc', 'abc', '2020-11-03 13:10:39', '2020-11-03 13:10:39', 'Active', 'No'),
(17, 'Laxmi Pagare', 'webdeveloper@techrupt.in', 'Testing', 'grfhf udghidgh fjgokdjg jdgkjd ijogj dg odjgo dgoijdg odg jdog oidgj', '2020-11-05 17:22:20', '2020-11-05 17:22:20', 'Active', 'No'),
(18, 'Saurabh', 'digitalmarketing@techrupt.in', 'test', 'test', '2020-11-06 10:35:06', '2020-11-06 10:35:06', 'Active', 'No'),
(19, 'Saurabh', 'admin@nutridock.com', 'test', 'test', '2020-11-06 10:36:03', '2020-11-06 10:36:03', 'Active', 'No'),
(20, 'Saurabh', 'seo@techrupt.in', 'Test', 'Test', '2020-11-06 11:41:28', '2020-11-06 11:41:28', 'Active', 'No'),
(21, 'Surendra Singh', 'webdesigner@techrupt.in', 'ww', 'dwedwesde', '2020-11-07 14:40:16', '2020-11-07 14:40:16', 'Active', 'No'),
(22, 'Surendra Singh', 'webdesigner@techrupt.in', 'Web Designer', 'Check', '2020-11-11 11:12:10', '2020-11-11 11:12:10', 'Active', 'No'),
(23, 'Urvashi', 'urvashitikmani1310@gmail.com', 'abc', 'abide', '2020-11-12 18:11:03', '2020-11-12 18:11:03', 'Active', 'No'),
(24, 'Laxmi Pagare', 'pagarelaxmi@gmail.com', 'Queries', 'Testing', '2020-11-17 15:19:45', '2020-11-17 15:19:45', 'Active', 'No'),
(25, 'Saurabh', 'digitalmarketing@techrupt.in', 'Test', 'Test', '2020-11-17 18:05:39', '2020-11-17 18:05:39', 'Active', 'No'),
(26, 'Rajashree Marathe', 'developer@techrupt.in', 'testing', 'testing testing', '2020-11-20 16:02:15', '2020-11-20 16:02:15', 'Active', 'No'),
(27, 'saurabh', 'developer@nutridock.com', 'test', 'test', '2020-11-23 17:15:21', '2020-11-23 17:15:21', 'Active', 'No'),
(28, 'Rajashree Testing', 'developer@techrupt.in', 'Dummy Text', 'Dummy Text, Dummy Text, Dummy Text, Dummy Tex, tDummy Text, Dummy TextDummy Text', '2020-11-23 17:25:37', '2020-11-23 17:25:37', 'Active', 'No'),
(29, 'urvashi', 'marketing@nutridock.com', 'abc', 'abc', '2020-11-23 19:00:03', '2020-11-23 19:00:03', 'Active', 'No'),
(30, 'Rajashree Testing', 'developer@techrupt.in', 'hh', 'hgfhgfhfg', '2020-11-28 14:36:55', '2020-11-28 14:36:55', 'Active', 'No'),
(31, 'vXZCazQphKyxrM', 'shellcooponeill@aol.com', 'nPrXcIWMFyK', 'YIzjgoStDUG', '2020-12-02 11:31:38', '2020-12-02 11:31:38', 'Active', 'No'),
(32, 'lmDfXeybsaB', 'shellcooponeill@aol.com', 'rqyNILgJKWsafdCY', 'CxuMPmIpjn', '2020-12-02 11:31:39', '2020-12-02 11:31:39', 'Active', 'No'),
(33, 'thvEGwKYeMiH', 'cminpc@aol.com', 'vSNyBTsYHptFqGX', 'hiWlzYZwSQgxARKM', '2020-12-02 13:16:49', '2020-12-02 13:16:49', 'Active', 'No'),
(34, 'gbyFhAYlpMLBE', 'cminpc@aol.com', 'wycNPIsazu', 'nPFUDNuS', '2020-12-02 13:16:50', '2020-12-02 13:16:50', 'Active', 'No'),
(35, 'eDOnJtgajml', 'sherrilyng@verizon.net', 'mfSjbhyq', 'komBIvfHaXLJpEKZ', '2020-12-02 14:03:54', '2020-12-02 14:03:54', 'Active', 'No'),
(36, 'POjEeKDzMpHkF', 'sherrilyng@verizon.net', 'PxXiZVBgkpqHAS', 'pGtldIJP', '2020-12-02 14:03:55', '2020-12-02 14:03:55', 'Active', 'No'),
(37, 'VBXAfMwqj', 'nash.kelli@yahoo.com', 'YJuWLfZD', 'WdzhSgsEry', '2020-12-02 14:40:01', '2020-12-02 14:40:01', 'Active', 'No'),
(38, 'jfDbvQGJuWYM', 'nash.kelli@yahoo.com', 'XQBKROzLu', 'bAftEMLVxF', '2020-12-02 14:40:02', '2020-12-02 14:40:02', 'Active', 'No'),
(39, 'tqEGmKpjJs', 'mfajr71@yahoo.com', 'VYtOJKbvqSZxUCNg', 'jsPZaTRYzSiBvXhd', '2020-12-02 14:42:49', '2020-12-02 14:42:49', 'Active', 'No'),
(40, 'BWZsviakXUpC', 'mfajr71@yahoo.com', 'IRyvjVEAXeBCrW', 'gSrjMuTRJvkbezKN', '2020-12-02 14:42:52', '2020-12-02 14:42:52', 'Active', 'No'),
(41, 'VRPUYMfHeg', 'asoltani05@yahoo.com', 'CfyhpraqToQiGEW', 'nLWJZFldaGITzDAP', '2020-12-02 15:16:18', '2020-12-02 15:16:18', 'Active', 'No'),
(42, 'gxTEPRisGqZDwvb', 'asoltani05@yahoo.com', 'ZAJuUPblSjeBmMzK', 'FCJtAdwNBWIf', '2020-12-02 15:16:20', '2020-12-02 15:16:20', 'Active', 'No'),
(43, 'tQAkCvgceSUjBnOo', 'flojo30c@yahoo.com', 'EzoLvPMBUgkT', 'lgxFDqRHpQvUbSTi', '2020-12-02 16:43:48', '2020-12-02 16:43:48', 'Active', 'No'),
(44, 'VvDTFWXQodmNSjI', 'flojo30c@yahoo.com', 'wQdHspykxCGKNEFD', 'kChutNJEjUz', '2020-12-02 16:43:53', '2020-12-02 16:43:53', 'Active', 'No'),
(45, 'RcPdVBqJMKnDrywH', 'benbrown09@bellsouth.net', 'uoCzAQOjLMb', 'eXzinfhxy', '2020-12-02 17:11:36', '2020-12-02 17:11:36', 'Active', 'No'),
(46, 'qouGTrWX', 'benbrown09@bellsouth.net', 'jpJflEPgZFRXOhH', 'YwZMIXOQfp', '2020-12-02 17:11:38', '2020-12-02 17:11:38', 'Active', 'No'),
(47, 'obFmdrBsScKpyQu', 'smhyde0406@yahoo.com', 'epGqfDJFyV', 'CDHmyOgkMN', '2020-12-02 17:20:24', '2020-12-02 17:20:24', 'Active', 'No'),
(48, 'hSZupenYLjmvDX', 'smhyde0406@yahoo.com', 'UoisphNHMSAWm', 'sNWZRkXgLaAIe', '2020-12-02 17:20:26', '2020-12-02 17:20:26', 'Active', 'No'),
(49, 'GPBKabNiqFJhLAo', 'michmerk02@verizon.net', 'GSboRDBgQ', 'aFIyzMlhjpKt', '2020-12-02 19:22:52', '2020-12-02 19:22:52', 'Active', 'No'),
(50, 'GywrmqQOYCHcNbl', 'michmerk02@verizon.net', 'wiXtToeupMERg', 'SYdKnkRXZMmsJFe', '2020-12-02 19:22:54', '2020-12-02 19:22:54', 'Active', 'No'),
(51, 'LoipCgdmxrqcZ', 'jerholen1@aol.com', 'mYGeXVjyzvWaAFq', 'qEmzFvRTsbrOkalW', '2020-12-02 20:54:54', '2020-12-02 20:54:54', 'Active', 'No'),
(52, 'RmLNnljc', 'jerholen1@aol.com', 'resYRbJBcUWxOjE', 'qpseWQtoSXvwzr', '2020-12-02 20:54:55', '2020-12-02 20:54:55', 'Active', 'No'),
(53, 'rLjuDOnZzYtb', 'tderr4117@aol.com', 'blWeEiXPns', 'NaXUkISJ', '2020-12-02 22:54:40', '2020-12-02 22:54:40', 'Active', 'No'),
(54, 'coOyRBrvtAFx', 'tderr4117@aol.com', 'btZJIuSYVPasQK', 'sfGalqwFzEWCDVju', '2020-12-02 22:54:43', '2020-12-02 22:54:43', 'Active', 'No'),
(55, 'KNfYzDSBac', 'bigoleary@yahoo.com', 'LcVtvlfZM', 'ZYRAxPmbVoj', '2020-12-03 00:06:43', '2020-12-03 00:06:43', 'Active', 'No'),
(56, 'hGblrpVJfkWAwsmc', 'bigoleary@yahoo.com', 'QRmdfBeVzkb', 'sZNFCKdlq', '2020-12-03 00:06:48', '2020-12-03 00:06:48', 'Active', 'No'),
(57, 'dnytFXBqQNmlhKT', 'blancorojo@att.net', 'iWlYRkdXxfBp', 'NrwQTozfEZJFBCm', '2020-12-03 00:21:36', '2020-12-03 00:21:36', 'Active', 'No'),
(58, 'cOFkZCdGSEWybaDT', 'blancorojo@att.net', 'MWoSLmTD', 'YqgIStHUomrj', '2020-12-03 00:21:45', '2020-12-03 00:21:45', 'Active', 'No'),
(59, 'tFLUwgVcrXORQM', 'fenwick420@yahoo.com', 'mWKjGgystFNZCIz', 'YptLFCBDvwgiAXe', '2020-12-03 00:38:51', '2020-12-03 00:38:51', 'Active', 'No'),
(60, 'aGEQmPdWZ', 'fenwick420@yahoo.com', 'kGNTnCxoZzv', 'nWNghPixDQeAoXk', '2020-12-03 00:38:54', '2020-12-03 00:38:54', 'Active', 'No'),
(61, 'QBbkreNmqV', 'matthewrhershey@yahoo.com', 'QgnpLXRyduTze', 'XVyCGsLFS', '2020-12-03 01:02:48', '2020-12-03 01:02:48', 'Active', 'No'),
(62, 'PMgEjLoAIGznuYUS', 'matthewrhershey@yahoo.com', 'eplzCxQDId', 'lZqOtrwjWTyfYN', '2020-12-03 01:02:51', '2020-12-03 01:02:51', 'Active', 'No'),
(63, 'topten.aia', '2conv.ch@gmail.com', 'Free&easy to use youtube downloader, free and fast.', 'Hello folks, just came across your posts, really appreciate your works! \r\nWould like to post some useful free website, hope you like it. \r\nhttps://fabpdf.com/ \r\nhttps://myconverters.com \r\nhttps://topten.review/ \r\nhttps://vidusoft.com \r\nhttps://vanceai.com/image-enhancer/', '2020-12-03 01:39:14', '2020-12-03 01:39:14', 'Active', 'No'),
(64, 'uSRNsBTqCtGwxrh', 'perry.lydia@ymail.com', 'SlvuXoIeTDigxNFL', 'lSbugxkJPhMjC', '2020-12-03 02:46:05', '2020-12-03 02:46:05', 'Active', 'No'),
(65, 'cAuSjLsVNFpvB', 'perry.lydia@ymail.com', 'mqJGSZiHplvxXdF', 'YUVWoyEGarFBwTDz', '2020-12-03 02:46:07', '2020-12-03 02:46:07', 'Active', 'No'),
(66, 'EUSeudtsVMn', 'perry.lydia@ymail.com', 'KaRxeodFu', 'WTQpbxUiRflgjk', '2020-12-03 02:48:43', '2020-12-03 02:48:43', 'Active', 'No'),
(67, 'iZgRBoUOrIutWHYp', 'perry.lydia@ymail.com', 'ngxauYoELWzl', 'VNLIrEkg', '2020-12-03 02:48:45', '2020-12-03 02:48:45', 'Active', 'No'),
(68, 'uFOkdPQVGlmE', 'a.farmer@yahoo.com', 'IgsWJcVnlhXR', 'pJmIQhlrbe', '2020-12-03 05:14:09', '2020-12-03 05:14:09', 'Active', 'No'),
(69, 'jXUviMTmSExFhqB', 'a.farmer@yahoo.com', 'exqcaBkL', 'mhBKdvDtjIyrAOPL', '2020-12-03 05:14:10', '2020-12-03 05:14:10', 'Active', 'No'),
(70, 'Elden Hailes', 'hailes.elden@gmail.com', 'Why did the chicken go to the séance? To get to the other side.', 'Good Afternoon people at nutridock.com,\r\nHope you’re great. \r\nI\'m , I hope you liked the joke in the subject and that the company is good and you’ve been achieving a lot throughout the current situation.\r\nAs I’ve had written to you long time ago in the past.\r\nWe want to introduce our explainer video plan to you that can benefit your web site nutridock.com.\r\nCheck out some of our existing videos here:\r\nhttps://youtu.be/bj3Nea4n0no\r\nhttps://youtu.be/rY722qtQ9tc\r\nhttps://youtu.be/jLncTNoZyks\r\nAll of our videos are in a similar animated format as the above examples, and we have voice-over artists with US/UK/Australian accents.\r\nThey can show a solution to a challenge or promote one of your services or products. They are concise, might be uploaded to video service like Youtube, and embedded in your website or featured on landing pages.\r\nOur prices are as follows depending on video length:\r\n0-1 minutes = $159\r\n1-2 minutes = $269\r\n2-3 minutes = $379\r\nAll prices above have been in USD you need to include a custom video, full script, along with a voice-over. If this is something you want to discuss further, you may order our your video in https://frama.link/explainervideo264186, it will be ready in 3-5 working days.\r\nIf you are not interested, just ignore this email and that we won\'t email you again.\r\nKind regards,', '2020-12-03 05:19:47', '2020-12-03 05:19:47', 'Active', 'No'),
(71, 'bBjVgLdKQO', 'bancale1964@yahoo.com', 'MWVSCXJdGerR', 'WFaHQpovfcy', '2020-12-03 06:11:05', '2020-12-03 06:11:05', 'Active', 'No'),
(72, 'iwzqvVDkSPg', 'bancale1964@yahoo.com', 'obkfYweOm', 'iSHAEQjUJDzaw', '2020-12-03 06:11:07', '2020-12-03 06:11:07', 'Active', 'No'),
(73, 'cdfmqxtl', 'philipshepherd@att.net', 'sjqJTWNFlEor', 'VNPbJtXM', '2020-12-03 08:11:19', '2020-12-03 08:11:19', 'Active', 'No'),
(74, 'FHQRSGVOb', 'philipshepherd@att.net', 'KOCmjbhH', 'kazHefpn', '2020-12-03 08:11:21', '2020-12-03 08:11:21', 'Active', 'No'),
(75, 'RfHWSkTdpegXI', 'giberticori@yahoo.com', 'LTXOaWqyDExC', 'akTAsrVUFXMe', '2020-12-03 08:48:58', '2020-12-03 08:48:58', 'Active', 'No'),
(76, 'YrPZhtMBmGTHi', 'giberticori@yahoo.com', 'nDxhjIbeKzYwv', 'AUBPxlNkbWYIiEqy', '2020-12-03 08:48:59', '2020-12-03 08:48:59', 'Active', 'No'),
(77, 'maricelatb11', 'renaig16@kenshin89.gleella.buzz', 'New project started to be available today, check it out', 'Best Nude Playmates & Centerfolds, Beautiful galleries daily updates\r\nhttp://milffreepornii.energysexy.com/?melanie \r\n\r\n chinese hardcore porn tubes 50 plus mpg porn free porn finder downloads sex porn gangbang tamil girls porn', '2020-12-03 10:39:07', '2020-12-03 10:39:07', 'Active', 'No'),
(78, 'rbfzCFNGka', 'moffat_farm@yahoo.com', 'XAkQLFwePbDYGj', 'iDkJCfmOunosEY', '2020-12-03 10:41:47', '2020-12-03 10:41:47', 'Active', 'No'),
(79, 'BrowiPEm', 'moffat_farm@yahoo.com', 'yxGMgvEZ', 'NrLKnEbBVPOTgS', '2020-12-03 10:41:50', '2020-12-03 10:41:50', 'Active', 'No'),
(80, 'pdhDYJzq', 'tylerdonovan01052006@yahoo.com', 'lUbdQxYNV', 'NQGdSckVFIfiOjL', '2020-12-03 12:42:23', '2020-12-03 12:42:23', 'Active', 'No'),
(81, 'ElCtUIVHDPbg', 'tylerdonovan01052006@yahoo.com', 'UTileXhwCrKk', 'FhdyqLHXjT', '2020-12-03 12:42:26', '2020-12-03 12:42:26', 'Active', 'No'),
(82, 'Surendra singh', 'webdesigner@techrupt.in', 'test', '', '2020-12-03 13:02:55', '2020-12-03 13:02:55', 'Active', 'No'),
(83, 'geQmCNTHLEbOPi', 'louielulham@yahoo.com', 'nVwAhetNEl', 'cxgSzknVw', '2020-12-03 14:23:39', '2020-12-03 14:23:39', 'Active', 'No'),
(84, 'AbtplKuJe', 'louielulham@yahoo.com', 'wGRVkfiomt', 'GNJpsLqefdzjO', '2020-12-03 14:23:41', '2020-12-03 14:23:41', 'Active', 'No'),
(85, 'Johnnysiz', 'sdlusjfsa@rambler.ru', 'Годнота спасибо', 'Круто + за пост \r\n_________________ \r\n[URL=https://stavki-na-sport.playrealtopmoneygames.xyz/2959/]букмекерские конторы екатеринбурга[/URL]', '2020-12-03 15:05:21', '2020-12-03 15:05:21', 'Active', 'No'),
(86, 'Andrewfak', 'vasektitarev@gmail.com', 'Web camera Russia online video stream cities', '[url=http://en.world-cam.ru/cams/crimea-webcam-online/]Webcams Crimea online[/url]	Switch to fullscreen mode Webcams Crimea online and at least for a few moments, forget about work and household chores. It offers luxurious types of created nature, which is revealed to the world the beautiful landscapes of the Crimean Peninsula.', '2020-12-03 15:43:04', '2020-12-03 15:43:04', 'Active', 'No'),
(87, 'YgvFcGWobPLxpf', 'lrainey1298@verizon.net', 'uyInwLjdGNeMz', 'jfxaJGlUIoWHg', '2020-12-03 20:48:31', '2020-12-03 20:48:31', 'Active', 'No'),
(88, 'mIYjwSFRlhMDfW', 'lrainey1298@verizon.net', 'ivhpfbTYkE', 'pYXquRhjHze', '2020-12-03 20:48:33', '2020-12-03 20:48:33', 'Active', 'No'),
(89, 'Contactrussy', 'no-replyledmihoodo@gmail.com', 'Do you want cheap and innovative advertising for little money?', 'Gооd dаy!  nutridock.com \r\n \r\nDid yоu knоw thаt it is pоssiblе tо sеnd lеttеr   lеgit? \r\nWе submit а nеw lеgitimаtе mеthоd оf sеnding businеss prоpоsаl thrоugh fееdbасk fоrms. Suсh fоrms аrе lосаtеd оn mаny sitеs. \r\nWhеn suсh mеssаgеs аrе sеnt, nо pеrsоnаl dаtа is usеd, аnd mеssаgеs аrе sеnt tо fоrms spесifiсаlly dеsignеd tо rесеivе mеssаgеs аnd аppеаls. \r\nаlsо, mеssаgеs sеnt thrоugh fееdbасk Fоrms dо nоt gеt intо spаm bесаusе suсh mеssаgеs аrе соnsidеrеd impоrtаnt. \r\nWе оffеr yоu tо tеst оur sеrviсе fоr frее. Wе will sеnd up tо 50,000 mеssаgеs fоr yоu. \r\nThе соst оf sеnding оnе milliоn mеssаgеs is 49 USD. \r\n \r\nThis оffеr is сrеаtеd аutоmаtiсаlly. Plеаsе usе thе соntасt dеtаils bеlоw tо соntасt us. \r\n \r\nContact us. \r\nTelegram - @FeedbackFormEU \r\nSkype  live:feedbackform2019 \r\nWhatsApp - +375259112693', '2020-12-04 00:10:07', '2020-12-04 00:10:07', 'Active', 'No'),
(90, 'SmmMer', 'florgek@yandex.ru', 'Бешанные скидки Автопостинг - старт проекта - во все соцсети', 'Отложенный постинг в инстаграм [url=https://postingall.ru/ ]и в остальные соц сети facebook Прокси и другие мощные инструменты[/url]', '2020-12-04 11:40:18', '2020-12-04 11:40:18', 'Active', 'No'),
(91, 'AntonioWeene', 'elbrusminyaev19880568jv+ccj@bk.ru', 'Ikfdsdjsdjsi jfidhjdaoskdoshfisjdo jifjowdoajdiwhfiwjdc iwjfihgiehfoswjfiegiefhwij ififvjifhihfiwsjkcoshjvigedh jfijsfocsfcisfjiehdfiwsjo jfowsjfdowsufiwsfihdsicsi https://mail.ru/?yriwutrueyeiwiryeuriweieutgdjhcjskfjdugvudjfishd', 'Ikfdsdjsdjsi jfidhjdaoskdoshfisjdo jifjowdoajdiwhfiwjdc iwjfihgiehfoswjfiegiefhwij ififvjifhihfiwsjkcoshjvigedh jfijsfocsfcisfjiehdfiwsjo jfowsjfdowsufiwsfihdsicsi https://mail.ru/?yriwutrueyeiwiryeuriweieutgdjhcjskfjdugvudjfishd', '2020-12-04 12:27:24', '2020-12-04 12:27:24', 'Active', 'No'),
(92, 'iNaKHEIAxjQ', 'claireabbe@aol.com', 'mowqlitpBMIuL', 'ECBzsFZtbWDHXG', '2020-12-04 14:25:05', '2020-12-04 14:25:05', 'Active', 'No'),
(93, 'mOnPUTpAvBIE', 'claireabbe@aol.com', 'MuSTxXpQaCvHrWze', 'OuzNDWjm', '2020-12-04 14:25:07', '2020-12-04 14:25:07', 'Active', 'No'),
(94, 'KMleIExSbwaXJzps', 'shermans4728@aol.com', 'yJTeVDMEvzW', 'WlPbhqVpXstCNBZE', '2020-12-06 18:16:38', '2020-12-06 18:16:38', 'Active', 'No'),
(95, 'gKhuJLDzbCO', 'shermans4728@aol.com', 'kzhHwbvYJNOy', 'rmRDdxzBJ', '2020-12-06 18:16:43', '2020-12-06 18:16:43', 'Active', 'No'),
(96, 'dnbVrtiLkSe', 'conshamyoov@gmail.com', 'yWuYXcLFIoZqAhK', 'jevMgApqFiKmIhSG', '2020-12-06 23:10:25', '2020-12-06 23:10:25', 'Active', 'No'),
(97, 'nOmIqxAPDKFzXary', 'conshamyoov@gmail.com', 'xtcpKdgFDJhQ', 'ueNGKQIfJ', '2020-12-06 23:10:28', '2020-12-06 23:10:28', 'Active', 'No'),
(98, 'KruwkCjZp', 'emerita.levesongower@yahoo.com', 'VhtPJgGwpvYz', 'fnARpkgmritwuUF', '2020-12-07 19:01:28', '2020-12-07 19:01:28', 'Active', 'No'),
(99, 'uJvwzidGZVYskf', 'emerita.levesongower@yahoo.com', 'dWOPjZIYFCKJbHE', 'FbJCNGWyKBuUV', '2020-12-07 19:01:30', '2020-12-07 19:01:30', 'Active', 'No'),
(100, 'OrsfuHpA', 'browne_shawnta@yahoo.com', 'rlLDKaZHqz', 'IzuncMHC', '2020-12-08 01:17:47', '2020-12-08 01:17:47', 'Active', 'No'),
(101, 'sPCtOdDxqamQTnH', 'browne_shawnta@yahoo.com', 'lheXvxgyMsu', 'GkdTvuVHcNrxysM', '2020-12-08 01:17:49', '2020-12-08 01:17:49', 'Active', 'No'),
(102, 'gfHAJFyxtM', 'brigidstanley@yahoo.com', 'vTDpIHxdLy', 'mUBTFtREWVp', '2020-12-08 06:23:04', '2020-12-08 06:23:04', 'Active', 'No'),
(103, 'nDKptAuEerR', 'brigidstanley@yahoo.com', 'KuahWlEpQeCi', 'qEQKNWtXZvCPT', '2020-12-08 06:23:05', '2020-12-08 06:23:05', 'Active', 'No'),
(104, 'pbGevBDLZXuURQ', 'shaundaclemy@yahoo.com', 'nDBdulPWX', 'SPiHwyIbYJFQmLG', '2020-12-09 07:44:50', '2020-12-09 07:44:50', 'Active', 'No'),
(105, 'DbaKtyiNhM', 'simonesteele390@yahoo.com', 'utUIRdXvTH', 'kAuPpOXmWfQTHvC', '2020-12-10 15:38:47', '2020-12-10 15:38:47', 'Active', 'No'),
(106, 'fpyECxUSczQV', 'simonesteele390@yahoo.com', 'YDyLpSfQlzhgXc', 'jrYGZJPtud', '2020-12-10 15:38:49', '2020-12-10 15:38:49', 'Active', 'No'),
(107, 'testing', 'webdesigner@techrupt.in', 'websit check', 'hello check', '2020-12-12 11:33:26', '2020-12-12 11:33:26', 'Active', 'No'),
(108, 'SOyIjAtlVirfCuUd', 'flemingfay9@gmail.com', 'vknsKrxDulp', 'ZynRofrgXYMheDS', '2020-12-14 16:06:26', '2020-12-14 16:06:26', 'Active', 'No'),
(109, 'ljRadVnfNKDvhs', 'flemingfay9@gmail.com', 'MmaOdhcuZU', 'ALTPxyigCmow', '2020-12-14 16:06:28', '2020-12-14 16:06:28', 'Active', 'No'),
(110, 'UjoSHDqVfdKY', 'anjaballantyne@yahoo.com', 'KhPAjaFln', 'XPWRJzNiVBw', '2020-12-14 18:29:02', '2020-12-14 18:29:02', 'Active', 'No'),
(111, 'RIqFWhYbCzlJ', 'anjaballantyne@yahoo.com', 'ybfwnmXj', 'kzHVKSrPd', '2020-12-14 18:29:06', '2020-12-14 18:29:06', 'Active', 'No'),
(112, 'NcHRzBdSo', 'kaydora232@yahoo.com', 'xajqyzVep', 'fXWFqUpVsgTSiecA', '2020-12-14 19:09:50', '2020-12-14 19:09:50', 'Active', 'No'),
(113, 'zAyVwWGoXZcLBeK', 'kaydora232@yahoo.com', 'tQDOWcxUqjI', 'dEWZuoySOQPlA', '2020-12-14 19:09:51', '2020-12-14 19:09:51', 'Active', 'No');

-- --------------------------------------------------------

--
-- Table structure for table `faq`
--

CREATE TABLE `faq` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_deleted` enum('No','Yes') NOT NULL,
  `status` enum('Active','Inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `faq`
--

INSERT INTO `faq` (`id`, `title`, `description`, `created_at`, `updated_at`, `is_deleted`, `status`) VALUES
(14, 'Are these photos I’m looking at real?', '<p>Absolutely! No matter how hard it is to believe, healthy food can look this good. There is hardly any editing in there. Try it out for yourself and find out!&nbsp; &nbsp; &nbsp; &nbsp;</p>', '2020-11-19 12:35:44', '2020-11-19 12:35:44', 'No', 'Active'),
(15, 'Is there the option of customisation or making special requests on my meal?', '<p>Nutridock aims to encourage everyone to make great strides on the path to fitness, and that is only possible when all of our unique needs are met. If you have any special instructions, feel free to mention them in the box. Even if you forget to do so, you can always call up the kitchen and get the changes done. Bon app&eacute;tit!</p>', '2020-11-19 12:36:32', '2020-11-19 12:36:32', 'No', 'Active'),
(16, 'How long after placing my order can I expect my food to arrive?', '<p>We know you are excited to receive your order as soon as possible and this is just why Nutridock ensures a super-fast delivery! You can expect fresh food at your doorstep within 60 minutes of ordering (subject to location constraints).</p>', '2020-11-19 12:36:53', '2020-11-19 12:36:53', 'No', 'Active'),
(17, 'How can I track calorie/nutrient intake on your food?', '<p>We understand that you won&rsquo;t feel healthy and fit from the inside unless you know exactly what you have been putting in your body. Thus, we mention the nutrients and calories on both the online platform and the delivery box. This will also help you in keeping a tab on your regular nutrition intake.</p>', '2020-11-19 12:39:40', '2020-11-19 12:39:40', 'No', 'Active'),
(18, 'How can I be sure of the health and safety standards?', '<p>You can count on us to make the best decision for your health and sanitation. We have stringent measures when it comes to ensuring that the food that reaches you is safe and the pandemic has further scaled up our efforts.</p>', '2020-11-19 12:40:09', '2020-11-19 12:40:09', 'No', 'Active'),
(19, 'You mentioned loyalty/rewards, what kind of benefits are we talking about in the future?', '<p>Nutridock loves fitness freaks! For each order that you place from our platform, we add loyalty points to your profile which you can reclaim on your next transaction. Healthy eating has never been more accessible!</p>', '2020-11-19 12:40:32', '2020-11-19 12:40:32', 'No', 'Active'),
(20, 'So how do I reach out to you in case of feedback (or just to tell you how awesome you are!)?', '<p>We are all ears always. You can turn in your feedback on the link that we will share with you over a message and a mail. Alternatively, you can also choose to reach out to us through the Contact Us section or on the email address mentioned on the website.</p>', '2020-11-19 12:40:54', '2020-11-19 12:40:54', 'No', 'Active'),
(21, 'How do I cancel or modify an order?', '<p>Our team puts in tremendous effort in every order that we deliver. Thus, cancelling and modifications aren&rsquo;t encouraged, and we won&rsquo;t be able to offer refunds.&nbsp;</p>\r\n\r\n<p>Yet, we understand that everyone makes mistakes. So, we provide a 10 minutes time frame after placing the order in which you can make the required changes.</p>\r\n\r\n<p><br />\r\n&nbsp;</p>', '2020-11-19 12:41:20', '2020-11-19 12:41:20', 'No', 'Active'),
(22, 'How should I stay up to date with offers, discounts and seasonal concessions?', '<p>If you want constant updates on how you can make your fitness journey with Nutridock more fruitful, you can subscribe to our newsletters. We would love to keep in touch with you.</p>', '2020-11-19 12:41:45', '2020-11-19 12:41:45', 'No', 'Active'),
(23, 'Is it safe to order from Nutridock during the COVID pandemic?', '<p>Of course! We make sure that the protocol regarding hygiene and sanitation is followed to the maximum extent. We believe in delivering nutritious meals at your doorstep safely. With us, you can be sure of a 360-degree wholesome experience.</p>', '2020-11-19 12:42:06', '2020-11-19 12:42:06', 'No', 'Active'),
(24, 'If I have subscribed to Nutridock, are there any other lifestyle changes that I need to make to see results?', '<p>Nutridock is not into making tall claims with no substance. While subscribing to Nutridock, is a good step in the direction of a healthy lifestyle, it isn&rsquo;t enough. You also need to make sure that you are exercising regularly, keeping your biological clock in check, following the right sleeping pattern and taking care of your dietary habits. Eating a pizza right after a salad just won&rsquo;t cut it!</p>', '2020-11-19 12:42:32', '2020-11-19 12:42:32', 'No', 'Active'),
(25, 'Do you have a refund policy?', '<p>The team at Nutridock puts in tremendous effort in every order that we deliver. So, providing a refund for a cancelled order isn&rsquo;t an option. Yet, you can cancel your order within a ten-minute time frame after placing it. We also take full responsibility if anything goes wrong from our side. If your order is misplaced or if the food is spoilt, we will be happy to provide a refund.</p>', '2020-11-19 12:42:52', '2020-11-19 12:42:52', 'No', 'Active'),
(26, 'Is weight loss guaranteed? What if this doesn\'t work for me?', '<p>At Nutridock, our philosophy is that fitness is the result of eating right, not dieting. So we will only give you nutrition recommendations that fit into your lifestyle, without being too drastic or difficult to follow. By setting realistic expectations, building healthy habits and following the prescribed meal plan religiously, we are sure you will make gradual progress. If not, our nutritionists are always on standby to answer your queries and help you succeed.</p>', '2020-11-19 12:43:34', '2020-11-19 12:43:34', 'No', 'Active'),
(27, 'How can I connect with a nutritionist in case of a query?', '<p>If you have any queries, feel free to reach out to us through the live chat option or the Contact Us section on the website. We will answer all of your questions in a jiffy!</p>\r\n\r\n<p><br />\r\nDo you still have a question that we haven&rsquo;t addressed? Feel free to reach out on customercare@nutridock.com</p>\r\n\r\n<p><br />\r\n&nbsp;</p>', '2020-11-19 12:44:02', '2020-11-19 12:44:02', 'No', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `food_avoid`
--

CREATE TABLE `food_avoid` (
  `food_avoid_id` int(11) NOT NULL,
  `food_avoid_name` varchar(250) NOT NULL,
  `is_active` enum('1','0') NOT NULL DEFAULT '1',
  `is_deleted` enum('1','0') NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `food_avoid`
--

INSERT INTO `food_avoid` (`food_avoid_id`, `food_avoid_name`, `is_active`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, 'Mushroom', '1', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'Peanuts', '1', '0', '2020-12-22 18:01:18', '2020-12-22 18:01:18'),
(3, 'Tofu', '1', '0', '2020-12-22 18:01:18', '2020-12-22 18:01:18'),
(4, 'Wheat', '1', '0', '2020-12-22 18:01:58', '2020-12-22 18:01:58'),
(5, 'Dairy', '1', '0', '2020-12-22 18:01:58', '2020-12-22 18:01:58'),
(6, 'Soy', '1', '0', '2020-12-22 18:02:11', '2020-12-22 18:02:11'),
(7, 'Nuts', '1', '0', '2020-12-22 18:02:11', '2020-12-22 18:02:11');

-- --------------------------------------------------------

--
-- Table structure for table `how_we_work`
--

CREATE TABLE `how_we_work` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `icon_image` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_deleted` enum('No','Yes') NOT NULL,
  `status` enum('Active','Inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `how_we_work`
--

INSERT INTO `how_we_work` (`id`, `title`, `icon_image`, `description`, `created_at`, `updated_at`, `is_deleted`, `status`) VALUES
(2, 'Curation of the perfect meal plan', '178c974180ac2965cfd499318aed6b6c34a527f1.svg', 'Anagha, our in-house nutritionist, uses her years of experience to devise the diet plan that will work the best for you. Stop starving yourself to fit into your favourite pair of jeans. Nutridock will make you fall in love with a healthy and sustainable lifestyle.', '2020-10-17 17:59:57', '2020-11-10 18:06:59', 'No', 'Active'),
(3, 'Achieving the target meal plan', '1867530e9b82de5b97c86302a67ff8849c6fe54e.svg', 'Our celebrity chef, Rakesh Talwar, breathes life into the words of our nutritionist. Good food is the foundation of genuine happiness, and nutritious food is nourishment for your soul. With over 35 years of experience, he is here to make healthy food tempting and finger-licking delicious', '2020-10-17 18:00:42', '2020-11-30 16:11:19', 'No', 'Active'),
(6, 'Serving it on your plate', 'fa0c2754867ebaab68079153126b4b06783aa73c.svg', 'The relentless efforts of our nutritionist and the magic of our chef result in sizzling hot, delicious and finger-licking food on your plate will be delivered by us. Perfectly lite in every bite!', '2020-10-26 17:20:31', '2020-11-30 15:54:45', 'No', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `ingredients`
--

CREATE TABLE `ingredients` (
  `id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `name` varchar(155) NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` enum('Active','Inactive') NOT NULL,
  `is_deleted` enum('No','Yes') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ingredients`
--

INSERT INTO `ingredients` (`id`, `menu_id`, `name`, `image`, `created_at`, `updated_at`, `status`, `is_deleted`) VALUES
(26, 11, 'Quinoa', '80eafcfa727679a479fe882dae8e4d0ef294ee37.jpg', '2020-11-18 18:08:19', '2020-11-18 18:08:19', 'Active', 'No'),
(27, 11, 'Red Pumpkin', '7e5577362ed2e7d126129c6dccde8696d79a9a35.jpg', '2020-11-18 18:09:14', '2020-11-18 18:09:14', 'Active', 'No'),
(28, 11, 'Broccoli', '82e3355e3cf36b140dda87e65bed766a705493f1.jpg', '2020-11-18 18:09:47', '2020-11-18 18:09:47', 'Active', 'No'),
(29, 11, 'Cherry Tomato', 'db86e2651e895e92464775893b7c597e26f95328.jpg', '2020-11-18 18:12:55', '2020-11-18 18:12:55', 'Active', 'No'),
(30, 11, 'Coriander', '908c4a162d49425ad886d89301a73cdd291a38d0.jpg', '2020-11-18 18:13:17', '2020-11-18 18:13:17', 'Active', 'No'),
(31, 11, 'Sliced Almonds', '4443ebd86cf4490c47ecb2c52661f38b37026ab7.jpeg', '2020-11-18 18:13:40', '2020-11-18 18:13:40', 'Active', 'No'),
(33, 12, 'Rocket Leaves', '450deea73d561485dd7ae58cb4cd4cda776ea228.jpg', '2020-11-20 14:32:22', '2020-11-20 14:32:22', 'Active', 'No'),
(34, 12, 'Baby Spinach', 'a99f444b54951b448ef2144364e5594837a743e3.jpg', '2020-11-20 14:32:47', '2020-11-20 14:32:47', 'Active', 'No'),
(35, 12, 'Black Olives', '988d793b18577e40555410ba1c0632d8345a4dc7.jpg', '2020-11-20 14:33:14', '2020-11-20 14:33:14', 'Active', 'No'),
(36, 12, 'Granola', '1b3ecfd31f16056c69ae8c3cef580126143aca72.jpg', '2020-11-20 14:33:37', '2020-11-20 14:33:37', 'Active', 'No'),
(37, 12, 'Honey', 'cb13d88880e61542cdc036bbd31f169ab54c65b1.jpg', '2020-11-20 14:33:58', '2020-11-20 14:33:58', 'Active', 'No'),
(38, 12, 'Kasundi Mustard', 'd42498b6c357f4fe2ffc735835607ec431134318.jpg', '2020-11-20 14:34:43', '2020-11-20 14:34:43', 'Active', 'No'),
(41, 14, 'Black Eyed Beans', '30ab648127b4fd34660126412774d1149d70ec09.jpg', '2020-11-20 15:59:56', '2020-11-20 15:59:56', 'Active', 'No'),
(42, 14, 'Onion', 'a2c328c60ab29d2425fd78bc6ceb31092a42ee73.jpg', '2020-11-20 16:00:17', '2020-11-20 16:00:17', 'Active', 'No'),
(43, 14, 'Tomato', '07b0e4093a1c929d87ce6bb382b8646c603bb4d6.jpg', '2020-11-20 16:00:38', '2020-11-20 16:00:38', 'Active', 'No'),
(44, 14, 'Pomegranate', 'fea7b7f12ffef332126c6c231ff59df71a1c830c.jpg', '2020-11-20 16:01:30', '2020-11-20 16:01:30', 'Active', 'No'),
(45, 14, 'Melon Seeds', '54c674549ce9b2a41a208df447423160f10dab2d.jpg', '2020-11-20 16:02:11', '2020-11-20 16:02:11', 'Active', 'No'),
(46, 14, 'Lettuce', 'c0d67cd7680ad30ea4f9f57d7314279f307c5ce2.jpg', '2020-11-20 16:02:47', '2020-11-20 16:02:47', 'Active', 'No'),
(47, 15, 'Tomato', 'e1b8578cdffa4c6ee2efd87425e6f23eaed90f16.jpg', '2020-11-20 16:17:22', '2020-11-20 16:17:22', 'Active', 'No'),
(49, 16, 'Tomato', 'abce9b5b777bdd186fcffd0d1b2c63d390fec422.jpg', '2020-11-20 17:35:24', '2020-11-20 17:35:24', 'Active', 'No'),
(50, 16, 'Basil', 'bd4f874aacb72ab73005400afab3768f92c386c0.jpg', '2020-11-20 17:35:43', '2020-11-20 17:35:43', 'Active', 'No'),
(51, 16, 'Olive', '25023896204be1aa5c53b12d2730701fb903cd9f.jpg', '2020-11-20 17:36:41', '2020-11-20 17:36:41', 'Active', 'No'),
(52, 17, 'Eggplant Bacon', 'e1aef3523540e012e664afa5c923455b100709ac.jpg', '2020-11-21 13:58:38', '2020-11-21 13:58:38', 'Active', 'No'),
(53, 17, 'Lettuce', '3edb90f9be3d733304927b13836fffea16c55a07.jpg', '2020-11-21 13:59:02', '2020-11-21 13:59:02', 'Active', 'No'),
(54, 17, 'Tomato', '947d7d1a357698692cba4d27471bce2e8985751f.jpg', '2020-11-21 13:59:26', '2020-11-21 13:59:26', 'Active', 'No'),
(55, 18, 'Lettuce', 'f45b90c387e3f7f77f9b5923eccb1811b9f2ab08.jpg', '2020-11-21 14:04:46', '2020-11-21 14:04:46', 'Active', 'No'),
(56, 18, 'Whole Grain Bread', 'd3f92d65afafefc20a0681cc2f6ed213c18d9328.jpg', '2020-11-21 14:05:08', '2020-11-21 14:05:08', 'Active', 'No'),
(57, 18, 'Tomatoes', '7b375b1db304bdef23e55baf40ce98fba8f76df4.jpg', '2020-11-21 14:05:24', '2020-11-21 14:05:24', 'Active', 'No'),
(58, 19, 'Chickpeas Falafel', 'a1c899bc25caf3bd00d891e82fe0f7ef49e6cde5.jpg', '2020-11-21 14:10:40', '2020-11-21 14:11:02', 'Active', 'No'),
(59, 19, 'Cucumbers', 'd8b393e2b87076214d73073a25a0d688e6c554dd.jpg', '2020-11-21 14:11:24', '2020-11-21 14:11:24', 'Active', 'No'),
(60, 19, 'Red onions', 'bf5e073e1f8637cd2781bd03d379d111254862fb.jpg', '2020-11-21 14:11:52', '2020-11-21 14:11:52', 'Active', 'No'),
(61, 20, 'Tofu', '7c284b06e7cd80318f3428f28115b2c92674ab48.png', '2020-11-21 14:15:56', '2020-11-21 14:15:56', 'Active', 'No'),
(62, 20, 'Red onions', '48c0908ab90851f1847e6756cb36bd7a86169492.jpg', '2020-11-21 14:16:19', '2020-11-21 14:16:19', 'Active', 'No'),
(63, 20, 'Yoghurt', '19f7cdf61c7e32bbcf61e718466ef27f893bcdd3.jpg', '2020-11-21 14:16:45', '2020-11-21 14:16:45', 'Active', 'No'),
(64, 21, 'Crunchy Peanut Butter', '0c2d6f3bf14aef8209dddc4ad35c08144cae2ae4.jpeg', '2020-11-21 14:20:05', '2020-11-21 14:20:05', 'Active', 'No'),
(65, 21, 'Spiced Walnuts', '8dc0afa334c0e5997e5c55d5d7ae494ee38c2780.jpg', '2020-11-21 14:20:22', '2020-11-21 14:21:17', 'Active', 'No'),
(66, 21, 'Dried Cranberry', '5c40a2cfa57bb2dcacabc2c56705e4183978ca11.jpg', '2020-11-21 14:20:57', '2020-11-21 14:20:57', 'Active', 'No'),
(67, 22, 'Lettuce', 'e9b0499dff5805f15ac2b4b41c2ec3aa5173f1b1.jpg', '2020-11-21 14:24:05', '2020-11-21 14:24:05', 'Active', 'No'),
(68, 22, 'Black Olives', '2868bc45c96f3dee8131708e40f6b06025ca9784.jpg', '2020-11-21 14:24:24', '2020-11-21 14:24:24', 'Active', 'No'),
(69, 22, 'Tomatoes', '885b192ed04439139d2ff6111bcfa0b834fa5e6a.jpg', '2020-11-21 14:24:49', '2020-11-21 14:24:49', 'Active', 'No'),
(70, 23, 'Baby Spinach', '7fb7cd4934ada391df8b0070d4f94bd47f978830.jpg', '2020-11-21 14:36:11', '2020-11-21 14:36:11', 'Active', 'No'),
(71, 23, 'Kiwi', '8c4aca7734d225eb49bcb8e60f88e6482a33bea7.jpg', '2020-11-21 14:36:26', '2020-11-21 14:36:26', 'Active', 'No'),
(72, 23, 'Mint', '1981678c7f54519622fbfff5cf47cefa9d7ab749.jpg', '2020-11-21 14:36:42', '2020-11-21 14:36:42', 'Active', 'No'),
(73, 23, 'Vanilla Whey Protein', '2c2cee5e6cded464e8c0f463980723143ffe2c9b.jpg', '2020-11-21 14:37:07', '2020-11-21 14:37:07', 'Active', 'No'),
(74, 23, 'Almonds', '143832b466ea1bae23691bce06127f6060255599.jpeg', '2020-11-21 14:37:39', '2020-11-21 14:37:39', 'Active', 'No'),
(75, 23, 'Green Apple', '5f4f9cf27f96510d76b553f783d151aba0cf3b88.jpg', '2020-11-21 14:37:57', '2020-11-21 14:37:57', 'Active', 'No'),
(76, 24, 'Coconut Milk', '75cb4eb5fc61f99ced4994d34746892ff9e5ef71.jpg', '2020-11-21 14:41:01', '2020-11-21 14:41:01', 'Active', 'No'),
(77, 24, 'Cashew', 'cbb55c9191d4a606fff2dd9752459aa0b9c59070.jpg', '2020-11-21 14:41:18', '2020-11-21 14:41:18', 'Active', 'No'),
(78, 24, 'Strawberry', 'f80bfa6906932bd0f1b675c164fe736c11fc5b0f.jpg', '2020-11-21 14:41:58', '2020-11-21 14:41:58', 'Active', 'No'),
(79, 25, 'Garlic parsley herb black rice', '406cc642ee1368a6e7f84243d1d26d989255fbc1.jpg', '2020-11-21 14:48:39', '2020-11-21 14:48:39', 'Active', 'No'),
(80, 25, 'Tofu', '22439370d5cecb2da2f48bcf880e28d0990caf8c.png', '2020-11-21 14:49:00', '2020-11-21 14:49:00', 'Active', 'No'),
(81, 25, 'Grilled Vegetables', 'eb40e90cd872eaf691cd9f91682edfcd560eebac.jpg', '2020-11-21 14:50:10', '2020-11-21 14:50:10', 'Active', 'No'),
(82, 26, 'Steamed brown rice', '6b3ea21e48ebff4a0b063b0abae7563ac04de3b3.jpg', '2020-11-21 14:53:06', '2020-11-21 14:53:06', 'Active', 'No'),
(83, 28, 'Kachumber', '94d9b0239ab014346839774bf20c5478070bfb55.jpeg', '2020-11-21 15:01:12', '2020-11-21 17:56:53', 'Active', 'No'),
(84, 28, 'Kadhai Gravy', '67db71f64c122a27f03dede91b587767aace637a.jpg', '2020-11-21 15:02:50', '2020-11-21 15:02:50', 'Active', 'No'),
(85, 28, 'Brown Rice', '92b13690362ffe10f52d53b33b158643a38622e1.jpg', '2020-11-21 15:03:08', '2020-11-21 15:03:08', 'Active', 'No'),
(86, 29, 'Wok Tossed Schezwan Tofu', '6cd6e975f0feee10b1f04160408fd4260a365da6.png', '2020-11-21 17:51:00', '2020-11-21 17:51:00', 'Active', 'No'),
(87, 29, 'Brown Rice', 'bb7f272eb59d06917b4bfcc0c6763cb6fea7b51b.jpg', '2020-11-21 17:51:52', '2020-11-21 17:51:52', 'Active', 'No'),
(88, 29, 'Steamed Pok Choy', '97137c5956bd5643bb760634a5b434fb929cc903.jpg', '2020-11-21 17:52:30', '2020-11-21 17:52:30', 'Active', 'No'),
(89, 30, 'Kachumber', '0c3e93c0f4a0a5cf3d5cee495136fc2a7b99981a.jpeg', '2020-11-21 17:54:59', '2020-11-21 17:54:59', 'Active', 'No'),
(90, 30, 'Chickpeas rice', '18c9b98ca64d6b5989fb3e96ed07f00712b9366a.jpg', '2020-11-21 17:55:29', '2020-11-21 17:55:29', 'Active', 'No'),
(91, 30, 'Curried coconut sauce', '4f1372685deafffc670d1cfecfda034fda23e276.jpg', '2020-11-21 17:56:05', '2020-11-21 17:56:05', 'Active', 'No'),
(92, 31, 'Quinoa', '038fe2443f9f528f79e811ca840509cdc7f26d37.jpg', '2020-11-21 18:02:38', '2020-11-21 18:02:38', 'Active', 'No'),
(93, 31, 'Kale', '910179bdc684ddf2c605e75cdb67f0522e2abb4e.jpg', '2020-11-21 18:02:53', '2020-11-21 18:02:53', 'Active', 'No'),
(94, 31, 'Baby Spinach', '2199b2de43772ee60e71e77e3763cb5a0ffc1616.jpg', '2020-11-21 18:03:13', '2020-11-21 18:03:13', 'Active', 'No'),
(95, 31, 'Pok Choy', '0914f6d4ccbe154a2891510e28fcdda665cc0a23.jpg', '2020-11-21 18:03:59', '2020-11-21 18:03:59', 'Active', 'No'),
(96, 31, 'Chinese Cabbage', '6e3b9ab0a903c38ce4d14b82b2a22bad5abe038a.jpg', '2020-11-21 18:04:17', '2020-11-21 18:04:17', 'Active', 'No'),
(97, 31, 'Zucchini', '19af1b1780496c4b840fcaaf7ced1b14b7f18ce4.jpg', '2020-11-21 18:04:33', '2020-11-21 18:04:33', 'Active', 'No'),
(98, 32, 'Banana', 'b0853c6115c4aeaeada9ef7e4b264ebfa980e5dc.jpg', '2020-11-21 18:09:36', '2020-11-21 18:09:36', 'Active', 'No'),
(99, 32, 'Strawberry', '00c8c13e57c8e8ce154233fa2b9984d199dba43b.jpg', '2020-11-21 18:09:55', '2020-11-21 18:09:55', 'Active', 'No'),
(100, 32, 'Yoghurt', '9ce3d48bbf1d43a422420f24129c2ed419f4aa8e.jpg', '2020-11-21 18:10:11', '2020-11-21 18:10:11', 'Active', 'No'),
(101, 33, 'Creamy Peanut Butter', '5b73313b15c69139218b1be6a55b90a93d6ac51f.jpeg', '2020-11-21 18:13:01', '2020-11-21 18:13:01', 'Active', 'No'),
(102, 33, 'Flax Seeds', 'fe0050e0c40e34fc5df49085b6f7ae86ff3d847d.jpg', '2020-11-21 18:13:29', '2020-11-21 18:13:29', 'Active', 'No'),
(103, 33, 'Almond Milk', '37ba849e6ded5793d56bc5154dddb1cf9672e1ce.jpg', '2020-11-21 18:13:48', '2020-11-21 18:13:48', 'Active', 'No'),
(104, 34, 'Orange', 'd321cbe5fef7c2d48e20a140d0e001e3bf53de1a.jpg', '2020-11-26 16:36:28', '2020-11-26 16:36:28', 'Active', 'No'),
(105, 34, 'Ginger', '2e302ce22aab773c5e7a4d35db514c7bad64082d.jpg', '2020-11-26 16:36:41', '2020-11-26 16:36:41', 'Active', 'No'),
(106, 34, 'Turmeric', '09e9d4cbab85448b7cca38358afb14d8b535bd6a.jpg', '2020-11-26 16:36:58', '2020-11-26 16:36:58', 'Active', 'No'),
(107, 36, 'Apple', '3904bf6ab22a218da212487485dd25ec84112af1.jpg', '2020-11-27 12:27:52', '2020-11-27 12:27:52', 'Active', 'No'),
(108, 36, 'Beetroot', 'fa660987b1ad285b19ca9572a02cc2710c315133.jpg', '2020-11-27 12:28:08', '2020-11-27 12:28:08', 'Active', 'No'),
(109, 36, 'Celery', '0efef772b500cd8b8b1500df57728f014d7b198e.jpg', '2020-11-27 12:29:49', '2020-11-27 12:29:49', 'Active', 'No'),
(110, 37, 'Carrot', '96a2b7d930d639f884e310bf480dd2247ca6f780.jpg', '2020-11-27 12:32:23', '2020-11-27 12:32:23', 'Active', 'No'),
(111, 37, 'Spinach', '5bcd2293eff2dbcaee10f63a033f36b94dee6b0e.jpg', '2020-11-27 12:32:47', '2020-11-27 12:32:47', 'Active', 'No'),
(112, 37, 'Apple', '3f04819ec6da950909bf31255985fdbdeaed84e1.jpg', '2020-11-27 12:33:13', '2020-11-27 12:33:13', 'Active', 'No'),
(113, 39, 'Chia Seeds', '89ba2beb06406f278a5a9de6a1fcb654d70fdbb3.jpg', '2020-11-27 12:43:31', '2020-11-27 12:43:31', 'Active', 'No'),
(114, 39, 'Coconut milk', '89b577a8c049ce528143dae1a776c5ea5cdd0428.jpg', '2020-11-27 12:43:52', '2020-11-27 12:43:52', 'Active', 'No'),
(115, 39, 'Jaggery', '1fd5b088c5fe7a67af30b07a6ff021b370bdb607.jpg', '2020-11-27 12:44:35', '2020-11-27 12:44:35', 'Active', 'No'),
(116, 15, 'Beetroot', '97bf66fc4d21c843e62fe658d91154651b298da4.jpg', '2020-11-27 12:55:55', '2020-11-27 12:55:55', 'Active', 'No'),
(117, 15, 'Turnip', '745dde26459235ea7f894a6aa94c2ea3ca2d9ada.jpg', '2020-11-27 12:56:11', '2020-11-27 12:56:11', 'Active', 'No'),
(118, 15, 'Sweet Potato', '9219bc746769e7068b095cad53d3cfd5289cbfa6.jpg', '2020-11-27 12:56:39', '2020-11-27 12:56:39', 'Active', 'No'),
(119, 15, 'Lemon', 'd7555e1c6e2d04eaed5ea65947408e1c5e051f90.jpg', '2020-11-27 12:57:00', '2020-11-27 12:58:11', 'Active', 'No'),
(120, 15, 'Coriander', '5ebf7a195780d5edaa66e9d0fb69fb2625788f2b.jpg', '2020-11-27 12:57:20', '2020-11-27 12:57:20', 'Active', 'No'),
(121, 40, 'Apple', 'cf2c7bcfa0c08086fdcd827110d82126f06a9f93.jpg', '2020-11-27 12:59:55', '2020-11-27 12:59:55', 'Active', 'No'),
(122, 40, 'Orange', '7ccd24849d3da53e8c1cd3c6887ea42782efdb58.jpg', '2020-11-27 13:00:52', '2020-11-27 13:00:52', 'Active', 'No'),
(123, 40, 'Kiwi', 'eb9165b2a07e9b68cf76dff57257b26574328956.jpg', '2020-11-27 13:01:05', '2020-11-27 13:01:05', 'Active', 'No'),
(124, 40, 'Spiced Walnuts', '50bb21c5116a639eef564ec8770f4b0436b19f09.jpg', '2020-11-27 13:01:37', '2020-11-27 13:01:37', 'Active', 'No'),
(125, 40, 'Watermelon', '75be8ea13e2878245222547b4ef85c5ac1fb958f.jpg', '2020-11-27 13:02:10', '2020-11-27 13:02:10', 'Active', 'No'),
(126, 40, 'Pomegranate', '9c4eb3d89c78a357dd0b8081660b8a7adb61e725.jpg', '2020-11-27 13:02:38', '2020-11-27 13:02:38', 'Active', 'No'),
(127, 41, 'Hummus', 'd7f0eab26733a631fabbb782256075c60be4da46.jpg', '2020-11-27 13:11:12', '2020-11-27 13:11:12', 'Active', 'No'),
(128, 41, 'Roasted Tomatoes', '5565281bb757209272dffed64949379d4ea88334.jpg', '2020-11-27 13:11:29', '2020-11-27 13:11:29', 'Active', 'No'),
(129, 41, 'Argula', '8139ae7d28525cf28b993585c57160821bfe2556.jpg', '2020-11-27 13:11:49', '2020-11-27 13:11:49', 'Active', 'No'),
(130, 42, 'Baby Spinach', '326b6f7689d0dc93e7e9e29577f775852db1de5d.jpg', '2020-11-27 13:17:22', '2020-11-27 13:17:22', 'Active', 'No'),
(131, 42, 'Almond Milk', 'd39cdabbbe16ae5f2eb1abffbd6b07a0a853713d.jpg', '2020-11-27 13:19:00', '2020-11-27 13:19:00', 'Active', 'No'),
(132, 42, 'Kiwi', '4ae132f3d5a60c6e6dbb6692936097fd859ad22e.jpg', '2020-11-27 13:19:24', '2020-11-27 13:19:24', 'Active', 'No'),
(133, 27, 'Quinoa', '0d567426800b551afb220228ecd66f513b31a60a.jpeg', '2020-11-28 17:23:23', '2020-11-30 11:52:58', 'Active', 'No'),
(134, 27, 'Garlic', 'dca0bb749642c0b1aad259390d8211fcea53250c.jpg', '2020-11-28 17:25:35', '2020-11-28 17:25:35', 'Active', 'No'),
(135, 27, 'Sambal Chutney', 'e60e62161e6f5dedf4963daf3c6707a067d32b17.jpg', '2020-11-28 17:26:58', '2020-11-28 17:26:58', 'Active', 'No'),
(136, 26, 'Kimchi', '8b19818763a6c3837dfe3e7d84d802cd37dc248a.jpeg', '2020-11-30 11:46:30', '2020-11-30 11:46:30', 'Active', 'No'),
(137, 26, 'Vegetable Thai Green Curry', '40a384191e1c4896263e509eadbbcd876a08c1ab.jpeg', '2020-11-30 11:48:27', '2020-11-30 11:48:27', 'Active', 'No'),
(138, 38, 'Dates', 'ec4086b4ae137fb248ec027cf82fb6b969644f20.jpg', '2020-12-09 16:04:26', '2020-12-09 16:04:26', 'Active', 'No'),
(139, 38, 'Almond Flour', '4a365a451dc9bff0135dbe38d2371c888b1ae972.jpg', '2020-12-09 16:05:15', '2020-12-09 16:05:15', 'Active', 'No'),
(140, 38, 'Walnut', '85e10747803dc84cdd7a63a46d48b2203bc3dd4f.jpg', '2020-12-09 16:06:23', '2020-12-09 16:06:23', 'Active', 'No');

-- --------------------------------------------------------

--
-- Table structure for table `meal_type`
--

CREATE TABLE `meal_type` (
  `meal_type_id` int(11) NOT NULL,
  `meal_type_name` varchar(255) NOT NULL,
  `is_active` enum('1','0') NOT NULL DEFAULT '1',
  `is_deleted` enum('1','0') NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `meal_type`
--

INSERT INTO `meal_type` (`meal_type_id`, `meal_type_name`, `is_active`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, 'Breakfast', '1', '0', '2020-12-21 15:45:09', '2020-12-21 15:45:09'),
(2, 'Lunch', '1', '0', '2020-12-21 15:45:38', '2020-12-21 15:45:38'),
(3, 'Snack', '1', '0', '2020-12-21 15:47:07', '2020-12-21 15:47:07'),
(4, 'Dinner', '1', '0', '2020-12-21 15:47:24', '2020-12-21 15:47:24');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `menu_category_id` int(11) NOT NULL,
  `menu_title` varchar(255) NOT NULL,
  `menu_description` text NOT NULL,
  `what_makes_dish_special` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `multiple_image` text NOT NULL,
  `specification` varchar(255) NOT NULL,
  `ingredients` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_deleted` enum('No','Yes') NOT NULL,
  `status` enum('Active','Inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `menu_category_id`, `menu_title`, `menu_description`, `what_makes_dish_special`, `image`, `multiple_image`, `specification`, `ingredients`, `created_at`, `updated_at`, `is_deleted`, `status`) VALUES
(11, 4, 'Super Autumn Salad', 'Loaded with all the nine amino acids', '<p>A favourite in the healthy food circuit, Quinoa (&ldquo;kinwa&rdquo;), is often hailed as a super grain. It is not only gluten-free but is loaded with all the nine amino acids making it twice as protein-packed as rice and barley. It can do wonders for diabetic patients with its anti-inflammatory properties and low GI Index.</p>', 'bc0198eaa43f2e636687583d125af43d6120802f.jpg', '5fc228c4bc036.jpg', 'High Protein,Gluten Free,Vegan', 'Roasted pumpkin, roasted broccoli, quinoa, chickpeas, cherry tomato, coriander, roasted almond, hemp oil lemon tahini dressing', '2020-11-18 18:06:56', '2020-11-28 16:09:00', 'No', 'Active'),
(12, 4, 'Fibre Me Up!', 'Barley Salad With Honey Mustard Balsamic Dressing', '<p>Barley, a chewy grain, tastes delicious in salads. It is packed with wholesome goodness to keep your digestive system fit as a fiddle. Moreover, honey fights off the peskiest of colds and coughs. This meal is the perfect amalgamation of light yet delicious and fulfilling.</p>', 'f60dc1810ab16d0e6ed1638159a2f194f0a180dc.jpg', '5fc228a09c983.jpg', 'Gluten Free', 'rocket leaves, baby spinach, sautee zucchini, olives, barley, pomogranate, feta, honey mustard balsamic dressing', '2020-11-20 14:31:41', '2020-11-28 16:08:24', 'No', 'Active'),
(14, 4, 'The \'Pump it Harder\' salad', 'Black Eyed Beans Salad With Tamarind Dressing', '<p>Treat your taste buds to a sweet and tangy salad with a kick of chilli at the back. It is utterly nutrilicious and packed with protein and fibre. One look at it and we assure you that you won&rsquo;t be able to hold yourself back!</p>', '7ac4f1ff2f2fa4376979cffddc8e3da6f3043fb4.jpg', '5fc2287cdb8f4.jpg', 'Gluten Free,Vegan', 'black eyed beans, onions, tomato, pomogranate, melon seeds, lettuce, cucumber, broccoli,parsley,charred peppers, tamarind dressing', '2020-11-20 15:58:45', '2020-11-28 16:07:48', 'No', 'Active'),
(15, 4, 'Earthy Salad', 'Hinglish Root Vegetable Salad With Lemon Corriander Dressing', '<p>It is a drop-dead gorgeous and fulfilling salad that you wouldn&rsquo;t mind eating every single day. It is packed to the brim with vitamins and minerals. Undoubtedly, it is an immunity booster which will keep your family hale and hearty.</p>', '45589f0427b6556b58979e6c664f624406aa4d86.jpg', '5fc2284d58071.jpg', 'Gluten Free,Vegan', 'carrots, beetroot, sweet potato, radish, turnips, baby potatoes, lemon coriander dressing', '2020-11-20 16:16:38', '2020-11-28 16:07:01', 'No', 'Active'),
(16, 5, 'Sandwich Italiano', 'Taking your regular little sandwich a notch up to spectacular', '<p>We take your regular little sandwich a notch up to spectacular! Whose mouth won&rsquo;t water at the thought of tomato, fresh mozzarella and basil all melted and gooey in a sandwich? This Italian sandwich is one of the simplest, most lightweight and tastiest lunch options.</p>', '2accb5793e936a81e03b1d280f45dbae8e3bb0eb.jpg', '5fc2282be8b46.jpg', '', 'whole grain bread, lettuce, olives, tomatoes, basil, mozzarella', '2020-11-20 17:23:23', '2020-11-28 16:06:27', 'No', 'Active'),
(17, 5, 'Vegan BLT', 'Better take on the classic BLT sandwich - tastier minus the cruelty', '<p>The Vegan BLT is crunchy, flavourful, smokey, lip-smacking delicious and filled with the freshest organic ingredients. It is a better take on the classic BLT sandwich - tastier minus the cruelty! It is a solid reason why a bacon-free world wouldn&rsquo;t be such a bad idea, after all.</p>', '4e40bd40ae8bc26b98629880ee69f7ee0b0e91b6.jpg', '5fc227fa8219b.jpg', 'Vegan', 'whole grain bread, vegan mayo, eggplant bacon, tomato, lettuce, red onion', '2020-11-21 13:57:32', '2020-11-28 16:05:38', 'No', 'Active'),
(18, 5, 'Pesto Cottage Cheese And Grilled Vegetable', 'A wholesome sandwich which can be a great start to your day', '<p>Pesto Cottage Cheese and Grilled Vegetable is a guilt-free indulgence that you will adore. The vegetables balance the nourishment composition well, and the bread supplied the much-required carbs. It is a wholesome sandwich which can be a great start to your day. Devour it now!</p>', '171b7e7aa16f93c77d6ff822d8fca5bd8180a288.jpg', '5fc227d421ccb.jpg', '', 'Whole grain bread, pesto cottage cheese,grilled vegetable, garlic sauce, lettuce, tomatoes', '2020-11-21 14:02:40', '2020-11-28 16:05:00', 'No', 'Active'),
(19, 7, 'Falafal Wrap', 'Just what you need to feel alive and kickin’', '<p>A falafel wrap with filling hummus is just what you need to feel alive and kickin&rsquo;. It is a yummy and healthier take on one of your favourite Mediterranean dishes. It is the perfect balance of texture, flavours and colours.</p>', 'cc6a304c00976c6742bb3bcd0e6e15d2dac5f0c1.jpg', '5fc227a329417.jpg', 'Vegan', 'whole grain wrap, chickpea falafel, hummus, pickled red onions, coriander, mixed greens, cucumber, hot garlic sauce', '2020-11-21 14:09:34', '2020-11-28 16:04:11', 'No', 'Active'),
(20, 7, 'Sriracha Tofu Salad Wrap', 'Spicy tofu and wholesome goodness', '<p>You will love these wraps filled wit veggies, spicy tofu and wholesome goodness. Eating fresh greens has never been this delicious!</p>', '635ce7241e517e3ced5abb051a5b277833a24148.jpg', '5fc2277e6d1ff.jpg', 'Spicy', 'whole grain wrap, wok tossed sriracha tofu, red onions, green apple slaw, sriracha vegan yogurt drizzle', '2020-11-21 14:14:53', '2020-11-28 16:03:34', 'No', 'Active'),
(21, 7, 'Granola Peanut Butter Wrap', 'It is sweet, crunchy, chewy and creamy – all in one!', '<p>Granola Peanut Butter Wrap is nutrient-rich and filled to the brim with essential proteins. It is sweet, crunchy, chewy and creamy &ndash; all in one! You will love the twist we have brought to the classic PB&amp;J routine!</p>', 'a94aa73eda5e3f51e51cd12aa97c86f730cc91ac.jpg', '5fc2275fdcca9.jpg', 'Vegan', 'whole grain wrap, crunchy peanut butter spread, green apple, dried cranberry, granola, spiced walnuts', '2020-11-21 14:19:23', '2020-11-28 16:03:03', 'No', 'Active'),
(22, 7, 'Moroccan Cottage Cheese Wrap', 'Herb Grilled Cottage Cheese, Hummus And Olives Wrap', '<p>This wrap is a fantastic blend of salad ingredients that you would surely dig. The olives add a punch of flavour to make it simply irresistible. A good source of calcium, selenium and protein, the cottage cheese provides a great option for cruelty-free nutritious intake.</p>', 'ff967242f99d433ffe49597beeb1dfedc10f2209.jpg', '5fc2273fd67c7.jpg', '', 'Whole grain wrap, hummus, lettuce, herb cottage cheese, black olives , green olives, tomatoes', '2020-11-21 14:23:32', '2020-11-28 16:02:31', 'No', 'Active'),
(23, 6, 'Healthy Greens Smoothie Bowl', 'Filled to the brim with essential proteins!', '<p>This smoothie brings together the sweetness of apple and kiwi with the twist of mint and spinach leaves. It is healthy for your heart too. To top it off, the vanilla whey protein makes it a full meal in itself.</p>', '1c697c229a72e97824d35e06f704cfddc463ca02.jpg', '5fc1f94759379.jpg', 'High Protein,Gluten Free,Vegan', 'kiwi, green apple, kale, mint, baby spinach, vanilla whey protein, jaggery topped with almonds & kiwi', '2020-11-21 14:35:38', '2020-11-28 12:46:23', 'No', 'Active'),
(24, 6, 'Chocolate Protein Smoothie Bowl', 'With fibre-rich dates and delicious coconut milk.', '<p>This sweet smoothie consists of fibre-rich dates and delicious coconut milk. The walnuts aren&rsquo;t just a good source of proteins but will also keep you fuller for longer. Needless, it is the missing piece in your health regimen! Grab yours now!</p>', '2bac21186f0217e903dad6afd9e12e82e2fca2ce.jpg', '5fc1f921c1647.jpg', 'Gluten Free,Vegan', 'cashew, coconut milk, chocolate whey protein, dates, maple syrup, topped with walnuts & strawberry', '2020-11-21 14:40:33', '2020-11-28 12:45:45', 'No', 'Active'),
(25, 1, 'Forbidden Rice Bowl', 'Black Rice, Tofu, Herb Vegetables, Peri Peri Sauce', '<p>Black rice, which forms the base of this dish, is a whole grain packed with antioxidants. It is pretty safe to say that black is the new brown! With crispy grilled tofu, it is all you would need for an easygoing, light yet fulfilling meal.</p>', '15ed36a41ed2238aa0512bff66308d3ac215505d.jpg', '5fc1f8f8a22a4.jpg', 'High Protein,Gluten Free,Vegan', 'garlic parsley herb black rice, grilled tofu, sauté herb vegetables, peri peri sauce', '2020-11-21 14:48:01', '2020-11-28 12:45:04', 'No', 'Active'),
(26, 1, 'Thai Meal Bowl', 'Brown Rice, Thai Curry, Kimchi', '<p>The Thai Green Curry is loaded with the choicest of vegetables, making it delectable. The fresh hot chilly peppers and the tempting coriander leaves make it vibrant. Relish every bite of nourishment in this classic dish.</p>', '20466c6e23fe77dcb06f202da97466889148fab1.jpg', '5fc1f8d5141f2.jpg', 'Gluten Free,Vegan', 'steamed boiled rice, vegetable thai green curry, kimchi', '2020-11-21 14:52:18', '2020-11-28 12:44:29', 'No', 'Active'),
(27, 1, 'Buddha Bowl', 'Stir Fried Quinoa, Oriental Wok Tossed Veggies, Sambal Chutney', '<p>The stir-fried quinoa is delicious and hearty; combined with veggies sweet and spicy ginger-soy sauce, it makes a combination of big flavour. Enjoy this incredibly satisfying dish either after office, post-workout or simply while lazying around during a weekend. It will make you fall in love with the wholesomeness of Oriental dishes all over again.</p>', '95c7ae53605c065179545265ef5655305c095cf8.jpg', '5fc1f8b5172d1.jpg', 'High Protein,Gluten Free,Vegan', 'garlic scallion stir fry quinoa, oriental veggies in ginger soy sauce, sambal chutney', '2020-11-21 14:55:58', '2020-11-28 12:43:57', 'No', 'Active'),
(28, 1, 'The Indian Wrestler', 'Tandoori Cottage Cheese Steak, Coriander, Brown Rice, Kadai Gravy, Kachumber', '<p>The Indian Wrestler is the perfect comfort food which is delicious yet nutritious. The kachumber adds its flavour to it while immensely enhancing the health quotient. Try it out for yourself!</p>', '647399ddc20ecf2f6038977eb876c3bca6dd738b.jpg', '5fc1f89870b8b.jpg', 'High Protein,Gluten Free,Indian Super Food', 'Tandoori cottage cheese, stir fried coriander chickpea brown rice, kadai gravy, kachumber', '2020-11-21 14:59:14', '2020-11-28 12:43:28', 'No', 'Active'),
(29, 1, 'AB\'s Favourite', 'Wok Tossed Schezwan Cottage Cheese, Basil Brown Rice, Steamed Pok Choy, Kimchi', '<p>Why can&rsquo;t vegans get abs? This dish which is loaded with protein-rich tofu proves it to be a rhetorical question. The salt pepper steamed Bok Choy has just the right amount of pepperiness. It doesn&#39;t go overboard and still retains its taste. Wondering how? Check it out yourself!</p>', '91b3d9bf56d3344bec2dda10af5a85d61889f122.jpg', '5fc1f87a387df.jpg', 'Gluten Free', 'Wok tossed Szechuan tofu, basil rice, salt pepper steamed pok choy, kimchi', '2020-11-21 17:50:17', '2020-12-15 14:21:05', 'No', 'Active'),
(30, 1, 'The Builders Paradise', 'Soya Bean Cottage Cheese Steak, Chickpea Rice, Curried Coconut Sauce, Kachumber', '<p>Enriched with the protein-filled goodness of soya bean and cottage cheese patty, The Builder&rsquo;s Paradise stays true to its name. Chickpea rice isn&rsquo;t just a source of a host of vitamins and minerals but also of fibre. Combined, they make one of the best immunity boosting dishes.</p>', '77381b98890a2d1b86801488a3bf6ea6bc45b049.jpg', '5fc1f85bf2275.jpg', 'High Protein,Gluten Free,Indian Super Food', 'Soya bean and cottage cheese patty, chickpea rice, curried coconut sauce, kachumber', '2020-11-21 17:54:20', '2020-11-28 12:42:27', 'No', 'Active'),
(31, 1, 'Stir Fried Greens And Quinoa', 'This savoury dish is a great post-workout meal.', '<p>This savoury dish is a great post-workout meal. Quinoa is a source of energizing iron and amino acids. Its proteins will provide the much needed nourishment to your toned body muscles. What&rsquo;s more? The potttasium in the quinoa also gives a tough fight to bloating.</p>', '25e74d3ee32d83eb6640810fbfc93cb8e5d3fea9.jpg', '5fc1f841630a6.jpg', 'High Protein,Gluten Free,Immunity Booster,Vegan', 'quinoa, kale, baby spinach, broccoli, pok choy, chinese cabbage, zucchini, peppers, orange ginger pepper sauce.', '2020-11-21 18:01:59', '2020-11-28 12:42:01', 'No', 'Active'),
(32, 6, 'Strawberry Banana Smoothie', 'It’s creamy; it’s sweet; it’s healthy, and oh so delightful!', '<p>Let&rsquo;s be real - bananas and strawberries are a match made in heaven. It&rsquo;s creamy; it&rsquo;s sweet; it&rsquo;s healthy, and oh so delightful! This heavenly drink will fuel your body for hours.</p>', '93aee7d0453ec74d94588645c15ea5f582d1b87f.jpg', '5fc1f81a3ae8a.jpg', 'Gluten Free', 'banana, frozen strawberry, yogurt, milk, vanilla essence, honey, cinnamon pwd', '2020-11-21 18:09:03', '2020-11-28 12:41:22', 'No', 'Active'),
(33, 6, 'Peanut Butter Apple Smoothie', 'Packed with nutrients and is wonderfully filling.', '<p>Who isn&rsquo;t fond of the classic combination of apple and peanut butter? With a hint of apple freshness, this smoothie is creamy, nutty and perfectly sweet. It is packed with nutrients and is wonderfully filling. Precisely, it is a treat to your soul.</p>', '07c16a7f64610a67771ac56644c570a99357072b.jpg', '5fc1f7efa3f46.jpg', 'High Protein,Gluten Free,Vegan', 'APPLE, CREAMY PEANUT BUTTER, FLAX SEEDS, ALMOND MILK, DATE SYRUP', '2020-11-21 18:12:21', '2020-11-28 12:40:39', 'No', 'Active'),
(34, 3, 'Immunity Charger', 'The perfect immunity booster for you!', '<p>This is an ode to all those health freaks who prefer wellness shots to booze shots. There can just not be a better drink with anti-inflammatory properties than this one. The vitamin C helps you fight off the flu season with a smile on your face. C&rsquo;mon, what more do you need to fall in love with it?</p>', '39f8b37639f97b87181ac962dbd1a3546c8781bb.jpg', '5fc1f7a13f738.jpg', 'Gluten Free,Immunity Booster,Vegan', 'Orange,Black Pepper, Turmeric & Ginger Juice', '2020-11-26 10:04:12', '2020-11-28 12:39:21', 'No', 'Active'),
(36, 3, 'The Cleanser', 'Turn heads with glowing skin and a detoxified soul with this healthy juice', '<p>Boost your immune system with this delicious vegetable juice! This deep red juice will seem like an elixir for life once you experience its healing properties. Turn heads with glowing skin and a detoxified soul with this healthy juice that you wouldn&rsquo;t mind getting addicted to.</p>', '94d1fa481bd1c4269f844244e398711d62747b5d.jpg', '5fc1f7835e245.jpg', 'Gluten Free,Vegan', 'Apple, Beetroot & Celery Juice', '2020-11-27 12:27:03', '2020-11-28 12:38:51', 'No', 'Active'),
(37, 3, 'Vision Enhancer', 'An appetizing and appealing juice.', '<p>Spinach has nutrients like high doses of iron, calcium and vitamins. If you are one of those lucky ones who can eat boiled spinach, good for you. If not, hop on to this nutrilicious alternative which combines it with the goodness of carrots to make an appetizing and appealing juice.</p>', '760b4b07fbc46142358854ac5a1ea1cb1e4d63a2.jpg', '5fc1f753bc834.jpg', 'Gluten Free,Vegan', 'Carrot, Spinach, Apple, Lemon', '2020-11-27 12:31:37', '2020-11-28 12:38:03', 'No', 'Active'),
(38, 2, 'Raw Brownie Bliss', 'Chewy, fudgy, deliciously chocolatey and guilt-free!', '<p>If you can&rsquo;t finish your meal without something sweet, Raw Brownie Bliss is perfect for you! It is chewy, fudgy, deliciously chocolatey and yet wholesome and full of nutrients. Shh! You can satisfy your taste buds without letting them know of our little secret of the healthy twist to your same old favourite brownie!</p>', 'c7996dfb0ea8a0a92346a12cf6673ee6b07c3eb4.jpg', '5fc1f72fb79e5.jpg', 'High Protein,Gluten Free,Vegan', 'Walnuts, almond flour, cocoa powder, dates, maple syrup, vanilla, salt', '2020-11-27 12:35:11', '2020-11-28 12:37:27', 'No', 'Active'),
(39, 2, 'Chia Seeds & Coconut Milk Pudding', 'Satisfying dessert, also rich in omega-3s', '<p>Chia seeds have the best of both the worlds &ndash; they make satisfying desserts and are also rich in omega-3s. This pudding is loaded with coconut flavour, which makes it irresistible. Satisfy your sweet tooth now!</p>', 'be0d4e9edfe8f1d24ddf664b10dbeeb450cf03af.jpg', '5fc1f6d8f21e5.jpg', 'Gluten Free,Vegan', 'Chia seeds, coconut milk, jaggery', '2020-11-27 12:41:18', '2020-11-28 12:36:00', 'No', 'Active'),
(40, 4, 'Tropical Fruit Salad', 'Fruit Delite With Orange Mayple Drizzle', '<p>You can taste the freshness in every bite of Fruit Deliite with Orange Maple Drizzle. A vitamin-rich option, its nourishing properties are a treat to your soul. It is also gluten-free. Can it get any better now?&nbsp;</p>', '3c8dac04ae37959e2b980930df0714ef6317224b.jpg', '5fc1f6b52fd0c.jpg', 'Gluten Free,Immunity Booster,Vegan', 'greens, apple, orange, pomogranate, watermelon, kiwi,papaya, spiced walnuts, mint, orange mayple drizzle', '2020-11-27 12:59:25', '2020-11-28 12:35:25', 'No', 'Active'),
(41, 5, 'Mediterranean Sandwich', 'Roasted Vegetable & Hummus Sandwich', '<p>Here comes the perfect heart-healthy vegetarian breakfast! The hummus makes the texture so creamy that even the most ardent of cheese lovers won&rsquo;t miss it. It is power-packed with nutrition and is healthy, flavourful and scrumptious, all in one!</p>', '64787287577684ba5218daedf066d6eb6bc658d2.jpg', '5fc1f68bf3912.jpg', 'Vegan', 'Whole grain bread, hummus, roasted tomatoes, roasted zucchini, roasted carrots and arugula.', '2020-11-27 13:10:05', '2020-11-28 12:34:43', 'No', 'Active'),
(42, 6, 'Green Protein Smoothie', 'This smoothie overflows with the healthiest of ingredients!', '<p>Almond milk is a fantastic source of vitamin E and calcium. Bananas contain moderate amounts of potassium but are packed with vitamin B6. Baby spinach is a rich source of vitamin K, A and C. As you must have gauged by now, this smoothie is overflowing with the healthiest of ingredients, grab yours now!</p>', '12749de47a90d41a566de2c7b6fd6d3e0b72f790.jpg', '5fc1f63529762.jpg', 'High Protein,Gluten Free,Vegan', 'BANANA, KIWI, ALMOND MILK, BABY SPINACH, VANILLA WHEY PROTEIN, COCONUT WATER.', '2020-11-27 13:16:51', '2020-11-28 12:33:17', 'No', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `menu1`
--

CREATE TABLE `menu1` (
  `id` int(11) NOT NULL,
  `menu_category_id` int(11) NOT NULL,
  `menu_title` varchar(255) NOT NULL,
  `menu_description` text NOT NULL,
  `what_makes_dish_special` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `multiple_image` text NOT NULL,
  `specification` varchar(255) NOT NULL,
  `ingredients` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_deleted` enum('No','Yes') NOT NULL,
  `status` enum('Active','Inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `menu1`
--

INSERT INTO `menu1` (`id`, `menu_category_id`, `menu_title`, `menu_description`, `what_makes_dish_special`, `image`, `multiple_image`, `specification`, `ingredients`, `created_at`, `updated_at`, `is_deleted`, `status`) VALUES
(1, 1, 'White bean', 'Lorem Ipsum is simply dummy text of the printing', '<p>Topped with a blend of parmesan and asiago cheese</p>\r\n\r\n<p>Our chefs recommend finishing your dish with freshly torn basil</p>', 'f5ef370814abaec8efdd800b2a8cf66781e6336f.jpg', '', '', '', '2020-11-18 13:55:35', '2020-11-18 13:55:35', 'No', 'Active'),
(2, 1, 'MASTERFUL PESTO PENNE', '', '<ul>\r\n	<li>Mixed with sauteed yellow squash, grape tomatoes, and cannellini beans (for protein)</li>\r\n	<li>Topped with creamy asiago cheese</li>\r\n	<li>Try finishing your dish with fresh basil and chopped almonds for crunch</li>\r\n</ul>', '28c5362960bbca7f88a6c04614d0c41f99167181.jpg', '', '', '', '2020-11-18 14:00:12', '2020-11-18 14:00:12', 'No', 'Active'),
(3, 2, 'PULLED PORK AL PASTOR', '', '<ul>\r\n	<li>Our take on the Mexican street-corner staple and West Coast food-truck favorite</li>\r\n	<li>Sous-vide pulled pork, marinated in citrus juices and basted in a mild sauce of ancho and guajillo chiles, agave, cumin, and paprika</li>\r\n	<li>Served on a bed of cilantro-lime rice and crowned with juicy nuggets of sweet pineapple and crumbled cotija cheese</li>\r\n</ul>', '5f3ab1561c166cb1bc82f9d8938df8cb5754d983.jpg', '', '', '', '2020-11-18 14:06:25', '2020-11-18 14:06:25', 'No', 'Active'),
(4, 2, 'PORK AL PASTOR', '', '', 'bc7d126a7c064b2bf796ff0c423057f585882d23.jpg', '5fb4e14c3b048.jpg,5fb4e14c3b132.jpg', 'High Protein,Gluten Free', '', '2020-11-18 14:24:36', '2020-11-18 14:26:24', 'No', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `menu_categories`
--

CREATE TABLE `menu_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(155) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_deleted` enum('No','Yes') NOT NULL,
  `status` enum('Active','Inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `menu_categories`
--

INSERT INTO `menu_categories` (`id`, `name`, `created_at`, `updated_at`, `is_deleted`, `status`) VALUES
(1, 'Bowls', '2020-10-23 16:24:40', '2020-10-23 16:24:40', 'No', 'Active'),
(2, 'Dessert', '2020-10-23 16:25:01', '2020-10-23 16:25:01', 'No', 'Active'),
(3, 'Juice', '2020-10-23 16:25:19', '2020-10-23 16:25:19', 'No', 'Active'),
(4, 'Salads', '2020-10-23 16:25:34', '2020-10-23 16:25:34', 'No', 'Active'),
(5, 'Sandwich', '2020-11-12 18:41:56', '2020-11-12 18:41:56', 'No', 'Active'),
(6, 'Smoothie', '2020-11-12 18:43:22', '2020-11-12 18:43:22', 'No', 'Active'),
(7, 'Wraps', '2020-11-13 11:42:13', '2020-11-13 11:42:13', 'No', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `menu_specification`
--

CREATE TABLE `menu_specification` (
  `id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `specification_id` int(11) NOT NULL,
  `icon_image` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_deleted` enum('No','Yes') NOT NULL,
  `status` enum('Active','Inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `menu_specification`
--

INSERT INTO `menu_specification` (`id`, `menu_id`, `specification_id`, `icon_image`, `created_at`, `updated_at`, `is_deleted`, `status`) VALUES
(16, 12, 2, 'e6a43e492fc41e1484395049537a16def0ecf89f.png', '2020-11-20 14:37:15', '2020-11-20 14:37:15', 'No', 'Active'),
(17, 11, 11, '2475d65053999db17fe46cc4ef7c844d0582f6c8.png', '2020-11-20 14:40:01', '2020-11-20 14:40:01', 'No', 'Active'),
(18, 11, 2, 'd466fc303b8892efb8eca7a99ded1541e3ef6740.png', '2020-11-20 14:40:18', '2020-11-20 14:40:18', 'No', 'Active'),
(19, 11, 1, '58e9633fe4df1deca9d05c3f8aec23ed5604e683.png', '2020-11-20 14:40:30', '2020-11-20 14:40:30', 'No', 'Active'),
(20, 17, 11, 'c3520c64a9d95c259697fc887eb49406164c86e2.png', '2020-11-21 13:59:56', '2020-11-21 13:59:56', 'No', 'Active'),
(21, 19, 11, 'b3dd07efa5f0f9702f808c26082df078569f3326.png', '2020-11-21 14:12:52', '2020-11-21 14:12:52', 'No', 'Active'),
(22, 20, 4, '9a544beb44fae31034fbf4258ea1b2ca466579b9.png', '2020-11-21 14:17:02', '2020-11-21 14:17:02', 'No', 'Active'),
(23, 21, 11, '0ec7baa4b74f6a7dca97f5c3004634a710c4fecc.png', '2020-11-21 14:21:48', '2020-11-21 14:21:48', 'No', 'Active'),
(24, 23, 1, '3519bb80dc3d8e7aaf7584267c316a33faa6526d.png', '2020-11-21 14:38:18', '2020-11-21 14:38:18', 'No', 'Active'),
(25, 23, 2, 'c3301fb17d44706beb4a770cd02170ee7afc635d.png', '2020-11-21 14:38:31', '2020-11-21 14:38:31', 'No', 'Active'),
(26, 23, 11, '411e3c6b2d0e2061352e7fb0eba19e6bd2144d90.png', '2020-11-21 14:38:40', '2020-11-21 14:38:40', 'No', 'Active'),
(27, 24, 2, 'fed3045906660f7ec184a640e66cc50cb4f0abd6.png', '2020-11-21 14:42:16', '2020-11-21 14:42:16', 'No', 'Active'),
(28, 24, 11, 'cd6f97f49a1007fe5c7ba3b05241b0f51dda32ec.png', '2020-11-21 14:42:24', '2020-11-21 14:42:24', 'No', 'Active'),
(29, 25, 1, 'cdeffd0e5b66dcd5ff6960f7e332b6f3e9b0aaeb.png', '2020-11-21 14:50:32', '2020-11-21 14:50:32', 'No', 'Active'),
(30, 25, 2, 'a4493cfd56cb9f5e2fc5a91c532b95b146a2bcf3.png', '2020-11-21 14:50:51', '2020-11-21 14:50:51', 'No', 'Active'),
(31, 25, 11, '36d0ad4199a96cf9f12813511cb977ced22f193a.png', '2020-11-21 14:51:00', '2020-11-21 14:51:00', 'No', 'Active'),
(32, 26, 2, '57a01c0fb09fadefeb63e9b1f5eb4d384c28e232.png', '2020-11-21 14:54:25', '2020-11-21 14:54:25', 'No', 'Active'),
(33, 26, 11, 'c44f874505cea7a912d517a07f3eec0447aab37c.png', '2020-11-21 14:54:36', '2020-11-21 14:54:36', 'No', 'Active'),
(34, 28, 1, 'd5153b8cbb8118aad5c10c25922b8174c7801b40.png', '2020-11-21 15:04:10', '2020-11-21 15:04:10', 'No', 'Active'),
(35, 28, 2, '98c761d6e4e243c80b971c6b1f8f32aa5981cd93.png', '2020-11-21 15:04:19', '2020-11-21 15:04:19', 'No', 'Active'),
(36, 28, 10, '31e5891879fad710c84b4b3f1655d9b757ae979e.png', '2020-11-21 15:04:28', '2020-11-21 15:04:28', 'No', 'Active'),
(37, 27, 1, '36f80cb03ed16be1b00f9545d4297c2d8cf43690.png', '2020-11-21 15:04:43', '2020-11-21 15:04:43', 'No', 'Active'),
(38, 27, 11, '699f233b0a829a109336a231b7222c441b06c1e3.png', '2020-11-21 15:04:54', '2020-11-21 15:04:54', 'No', 'Active'),
(39, 27, 2, 'c30298af9f1f79c0ce9b9e50cfa147b80bdef741.png', '2020-11-21 15:05:04', '2020-11-21 15:05:04', 'No', 'Active'),
(40, 29, 2, '6ec3bfca399ec12ff1ab67e8ddf3abbf05d83eb8.png', '2020-11-21 17:52:48', '2020-11-21 17:52:48', 'No', 'Active'),
(42, 30, 10, 'f161fd4c8e3d89086ad3ba3fa284cd854f085721.png', '2020-11-21 17:56:27', '2020-11-21 17:56:27', 'No', 'Active'),
(43, 30, 1, '920dfb0f110324420f95f7d087b553cfde69bbd2.png', '2020-11-21 17:56:50', '2020-11-21 17:56:50', 'No', 'Active'),
(44, 30, 2, '417def9855986b763b2d63f5810dc13483ea0ac1.png', '2020-11-21 17:57:19', '2020-11-21 17:57:19', 'No', 'Active'),
(45, 31, 9, 'dd6401863faa81a5d20d8871c7f06f89fd709eb9.png', '2020-11-21 18:04:53', '2020-11-21 18:04:53', 'No', 'Active'),
(46, 31, 2, '92fb1c1222c89da2ed7527f295f50511f7bb7833.png', '2020-11-21 18:05:12', '2020-11-21 18:05:12', 'No', 'Active'),
(47, 31, 1, 'bbef2be89a445e16b456b39468e5e498fba1d41d.png', '2020-11-21 18:05:22', '2020-11-21 18:05:22', 'No', 'Active'),
(48, 31, 11, 'f6eb4f9d145b9e648aa07e60392f220b658f4b64.png', '2020-11-21 18:05:48', '2020-11-21 18:05:48', 'No', 'Active'),
(49, 32, 2, 'e1edae2f1df32c495d45cb9db5c117c2734cb790.png', '2020-11-21 18:10:29', '2020-11-21 18:10:29', 'No', 'Active'),
(50, 33, 1, '1b9a51033a3287e3b1da34409357725a9b34250f.png', '2020-11-21 18:14:09', '2020-11-21 18:14:09', 'No', 'Active'),
(51, 33, 11, 'd09689f5152f73253ad12746be648ae8e3007462.png', '2020-11-21 18:14:19', '2020-11-21 18:14:19', 'No', 'Active'),
(52, 33, 2, 'db5f8d0f837ff3e3d1f88c944ab8664bc913f150.png', '2020-11-21 18:14:33', '2020-11-21 18:14:33', 'No', 'Active'),
(56, 39, 2, '9947163cc34092bac5cd2eaf91eb8c558958ab64.png', '2020-11-27 12:45:05', '2020-11-27 12:45:05', 'No', 'Active'),
(57, 39, 11, '12a91c40355aa97ec8ed5bf730f8e9f43f98c152.png', '2020-11-27 12:45:15', '2020-11-27 12:45:15', 'No', 'Active'),
(58, 38, 2, '0797cac785be4b4942d802dedffd35a68601295f.png', '2020-11-27 12:45:39', '2020-11-27 12:45:39', 'No', 'Active'),
(59, 38, 11, '3e8752db60711741d0e3bc4c7fb50d375e5d8af3.png', '2020-11-27 12:45:52', '2020-11-27 12:45:52', 'No', 'Active'),
(60, 38, 1, 'ebfeda85cda4ea94278c1b4c33c6c486b1157495.png', '2020-11-27 12:46:08', '2020-11-27 12:46:08', 'No', 'Active'),
(61, 37, 11, '3c2da8da158b6659feabc473aa7b6b5556ce169d.png', '2020-11-27 12:46:31', '2020-11-27 12:46:31', 'No', 'Active'),
(62, 37, 2, 'a3896d70c66d612c0f90d1b88805931993534e5e.png', '2020-11-27 12:46:39', '2020-11-27 12:46:39', 'No', 'Active'),
(63, 36, 11, '57529860b8c9d9915fe3b96a19b0cabc04eb515e.png', '2020-11-27 12:47:01', '2020-11-27 12:47:01', 'No', 'Active'),
(64, 36, 2, 'd35f89e24bef3909959b98f52bc6b69fe7aa405a.png', '2020-11-27 12:47:09', '2020-11-27 12:47:09', 'No', 'Active'),
(65, 34, 9, 'f7a7cc372f688f8a7fdae872d37ef7ad1854b96e.png', '2020-11-27 12:47:26', '2020-11-27 12:47:26', 'No', 'Active'),
(66, 34, 2, '8e4cd8c0067b656ae249003cf363eda168cd38b4.png', '2020-11-27 12:47:35', '2020-11-27 12:47:35', 'No', 'Active'),
(67, 34, 11, '155cd251c5943f63aebcbd75f2eb5ea9362bcac7.png', '2020-11-27 12:47:44', '2020-11-27 12:47:44', 'No', 'Active'),
(68, 14, 11, '5dd0c3f1e9888b16ceb210278cdb3d25d1bcc5c2.png', '2020-11-27 12:54:33', '2020-11-27 12:54:33', 'No', 'Active'),
(69, 14, 2, 'c2446bb746efcf979ddd63be82d008d51a042f50.png', '2020-11-27 12:54:43', '2020-11-27 12:54:43', 'No', 'Active'),
(70, 15, 2, 'd6df17856247c1d228ded2de48286ab307c810ee.png', '2020-11-27 12:55:15', '2020-11-27 12:55:15', 'No', 'Active'),
(71, 15, 11, 'c5312cfbc3766beb1a6067750186118c3bf40800.png', '2020-11-27 12:55:23', '2020-11-27 12:55:23', 'No', 'Active'),
(72, 40, 2, '966d3d43e46dfd2abf99d4f4e6f1a6e3db99b607.png', '2020-11-27 13:02:56', '2020-11-27 13:02:56', 'No', 'Active'),
(73, 40, 9, '928128bfe6d1f88f8048641f1021f88bb22aee06.png', '2020-11-27 13:03:07', '2020-11-27 13:03:07', 'No', 'Active'),
(74, 40, 11, '3c01734f6a38127f4236292dee5cab40a10ceb32.png', '2020-11-27 13:03:17', '2020-11-27 13:03:17', 'No', 'Active'),
(75, 41, 11, 'a0c8cba705da3f563aa999b0e0ca21cda38d6623.png', '2020-11-27 13:12:07', '2020-11-27 13:12:07', 'No', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `newsletter`
--

CREATE TABLE `newsletter` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` enum('Active','Inactive') NOT NULL,
  `is_deleted` enum('Yes','No') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `newsletter`
--

INSERT INTO `newsletter` (`id`, `email`, `created_at`, `updated_at`, `status`, `is_deleted`) VALUES
(1, 'webdeveloper@techrupt.in', '2020-09-03 10:55:18', '2020-09-03 10:55:18', 'Active', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `our_chefs`
--

CREATE TABLE `our_chefs` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `post` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_deleted` enum('No','Yes') NOT NULL,
  `status` enum('Active','Inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `our_chefs`
--

INSERT INTO `our_chefs` (`id`, `name`, `image`, `post`, `description`, `created_at`, `updated_at`, `is_deleted`, `status`) VALUES
(2, 'Fig Nelson', 'd376282256d9ef2341f858db91bd6891131b2f0e.jpg', 'Chef', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rerum dolor sequi quaerat, deleniti beatae ratione.', '2020-10-20 17:18:02', '2020-10-20 17:53:10', 'No', 'Active'),
(4, 'Josh Clark', '25cebb8985db53a57d4edb3c64a9ddaa575d9e63.jpg', 'Chef', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Inventore eveniet magnam nam, atqu.', '2020-10-20 17:28:41', '2020-10-20 17:53:43', 'No', 'Active'),
(6, 'Mary Jane', '3a0496a4e9c263748f2eeef14d7d6c4a29df2b29.jpg', 'Manager', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Perspiciatis cum minima mollitia, velit.', '2020-10-20 17:51:01', '2020-10-20 17:54:13', 'No', 'Active'),
(8, 'ABC Chef', 'bee9aa8dec0774fdaaef2de654d9fe6ab7aabd0d.jpg', 'Main Chef', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2020-11-20 12:22:33', '2020-11-20 12:22:33', 'No', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `our_healthy_farm`
--

CREATE TABLE `our_healthy_farm` (
  `id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `title_description` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_deleted` enum('No','Yes') NOT NULL,
  `status` enum('Active','Inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `our_healthy_farm`
--

INSERT INTO `our_healthy_farm` (`id`, `description`, `title`, `title_description`, `created_at`, `updated_at`, `is_deleted`, `status`) VALUES
(1, 'Mindful eating and living reimagined.', 'Splendidly wholesome', 'Refill your nutri tank with Nutridock! Your body will thank you for the vegetarian and wholesome food. \r\nPerfectly lite in every bite!', '2020-10-12 15:33:26', '2020-11-12 16:29:44', 'No', 'Active'),
(2, 'Testing', 'Utterly Nutrilicious', 'Salads so good, you will replace burgers with them! Each dish has been cooked with passion to hit the sweet spot between nutrition & finger-licking deliciousness.', '2020-10-12 15:34:01', '2020-11-12 16:17:50', 'No', 'Active'),
(8, 'abc', 'Wholly yours', 'Stop restricting yourself to the one-size-fits-all approaches and fad diet plans. Healthy eating is sustainable if you recognize your unique needs.', '2020-11-10 10:25:24', '2020-11-12 16:14:53', 'No', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `our_services`
--

CREATE TABLE `our_services` (
  `id` int(11) NOT NULL,
  `description` text NOT NULL,
  `icon_image` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `title_description` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_deleted` enum('No','Yes') NOT NULL,
  `status` enum('Active','Inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `our_services`
--

INSERT INTO `our_services` (`id`, `description`, `icon_image`, `title`, `title_description`, `created_at`, `updated_at`, `is_deleted`, `status`) VALUES
(1, '', '240e3585f22479ec2364c1425f8087bfe52316fa.svg', 'The best quality of food', 'Come hell or high water; we vouch to never compromise on the quality and health value of the food. Since we never discount on the freshness and the nourishment, we don’t offer discounts on prices either.', '2020-10-20 16:22:39', '2020-11-12 16:27:29', 'No', 'Active'),
(2, '', '12e09eb933777af61e1e813944fd61ea2f82b4e7.png', 'Environmentally benign', 'Let’s take one step closer towards not just detoxifying our bodies but also our environment. Moreover, as the most civilized species, we owe it to the others to be empathetic. Let goodness prevail with wholesome vegetarian food only.', '2020-10-20 16:24:04', '2020-11-30 16:27:57', 'No', 'Active'),
(3, '', '583c709a7573863ccf600fc916b8f64783162e2e.svg', 'Sustainable and accessible nutritious meal plans', 'Nutridock’s main motive is to make a healthy lifestyle sustainable for everyone. It cannot be achieved by going to extremes or unachievable fad diets, but by making sure that our body gets the right care that it deserves with every meal we eat.', '2020-10-20 16:24:26', '2020-11-20 12:14:29', 'No', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `physical_activity`
--

CREATE TABLE `physical_activity` (
  `physical_activity_id` int(11) NOT NULL,
  `physical_activity` varchar(250) NOT NULL,
  `is_active` enum('1','0') NOT NULL DEFAULT '1',
  `is_deleted` enum('1','0') NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `physical_activity`
--

INSERT INTO `physical_activity` (`physical_activity_id`, `physical_activity`, `is_active`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, 'No Activity', '1', '0', '2020-12-21 16:48:22', '2020-12-21 16:48:22'),
(2, 'Lightly Active (1-2 Days)', '1', '0', '2020-12-21 16:48:22', '2020-12-21 16:48:22'),
(3, 'Moderately Active (3-5 Days)', '1', '0', '2020-12-21 16:48:59', '2020-12-21 16:48:59'),
(4, 'Strongly Active (6-7 Days)', '1', '0', '2020-12-21 16:48:59', '2020-12-21 16:48:59');

-- --------------------------------------------------------

--
-- Table structure for table `pincode`
--

CREATE TABLE `pincode` (
  `id` int(11) NOT NULL,
  `pincode_no` int(11) NOT NULL,
  `area` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pincode`
--

INSERT INTO `pincode` (`id`, `pincode_no`, `area`) VALUES
(1, 422207, 'Asha nagar / Bhujbak knowlwdgw city'),
(2, 422006, 'Konark nagar / Narayan bapu nagar'),
(3, 422105, 'Eklahare'),
(4, 422003, 'Chandshi / Matori'),
(5, 422013, 'Pramod Nagar'),
(6, 422007, 'Satpur Colony / shivaji nagar'),
(7, 422005, 'Canada corner'),
(8, 422002, 'Tidke colony'),
(9, 422001, 'Panchavati'),
(10, 422011, 'jay prakash colony'),
(11, 422101, 'Nasik road'),
(12, 422009, 'Old cidco/ vinay nagar'),
(13, 422010, 'Ambad gaon / MIDC'),
(14, 422501, 'Gandhinagar / wadala gaon'),
(15, 422214, 'Bridge nagar / mankar mala'),
(16, 422213, 'Pimpalgaon bahula'),
(17, 422012, 'Vivekanand nagar'),
(18, 422008, 'torna nagar/ cidco'),
(19, 422004, 'Samarth nagar / mhasrul'),
(20, 422003, 'Adgaon');

-- --------------------------------------------------------

--
-- Table structure for table `slider`
--

CREATE TABLE `slider` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` enum('Active','Inactive') NOT NULL,
  `is_deleted` enum('No','Yes') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `slider`
--

INSERT INTO `slider` (`id`, `title`, `image`, `created_at`, `updated_at`, `status`, `is_deleted`) VALUES
(1, 'Perfectly Lite in Every Bite.', 'ad07297c292bc0438989452470058bd4292b7afa.jpg', '2020-10-10 16:36:26', '2020-12-16 12:44:38', 'Active', 'No'),
(2, 'Perfectly Lite in Every Bite', '0949916548548889a2b0c2e6455b67ba65f9d06b.jpg', '2020-10-10 17:51:36', '2020-12-16 12:44:46', 'Active', 'No'),
(3, 'ABC', '48258809a33257e35dc56d7322d5a8d726f02002.jpg', '2020-11-28 16:37:18', '2020-11-28 16:37:18', 'Active', 'No'),
(4, 'ABC', '60c3b33bb7ca67349d14e4ac10e7fda64fb4c11e.jpg', '2020-11-28 16:37:32', '2020-11-28 16:37:32', 'Active', 'No'),
(5, 'ABC', 'c341f7c455c7e95ae6fcd5c7282cae593eee7480.jpg', '2020-11-28 16:37:48', '2020-11-28 16:37:48', 'Active', 'No'),
(6, 'ABC', 'a1b85339dcff14f692361bde00332c8860e450fb.jpg', '2020-11-28 16:38:09', '2020-11-28 16:38:09', 'Active', 'No');

-- --------------------------------------------------------

--
-- Table structure for table `specification`
--

CREATE TABLE `specification` (
  `id` int(11) NOT NULL,
  `name` varchar(155) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_deleted` enum('No','Yes') NOT NULL,
  `status` enum('Active','Inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `specification`
--

INSERT INTO `specification` (`id`, `name`, `created_at`, `updated_at`, `is_deleted`, `status`) VALUES
(1, 'High Protein', '2020-10-27 12:07:30', '2020-10-27 12:07:30', 'No', 'Active'),
(2, 'Gluten Free', '2020-10-27 12:08:05', '2020-10-27 12:08:05', 'No', 'Active'),
(3, '<35g Carbs', '2020-10-27 12:08:23', '2020-10-27 12:08:23', 'No', 'Active'),
(5, 'Soy Free', '2020-10-27 12:08:46', '2020-10-27 12:08:46', 'No', 'Active'),
(7, '<500 Cal', '2020-10-28 18:08:25', '2020-10-29 11:12:47', 'No', 'Active'),
(9, 'Immunity Booster', '2020-11-18 18:29:00', '2020-11-18 18:29:00', 'No', 'Active'),
(10, 'Indian Super Food', '2020-11-18 18:29:17', '2020-11-18 18:29:17', 'No', 'Active'),
(11, 'Vegan', '2020-11-18 18:30:02', '2020-11-18 18:30:02', 'No', 'Active'),
(12, 'Diabetic', '2020-11-20 14:52:57', '2020-11-20 14:52:57', 'No', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `subscribe_discount`
--

CREATE TABLE `subscribe_discount` (
  `subscribe_discount_id` int(11) NOT NULL,
  `discount_on_amount` float NOT NULL,
  `discount_in_percent` float NOT NULL,
  `is_deleted` enum('No','Yes') NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` enum('Active','Inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subscribe_discount`
--

INSERT INTO `subscribe_discount` (`subscribe_discount_id`, `discount_on_amount`, `discount_in_percent`, `is_deleted`, `created_at`, `updated_at`, `status`) VALUES
(1, 0, 5, 'No', '2021-01-15 15:59:58', '2021-01-15 15:59:58', 'Active'),
(2, 0, 12, 'No', '2021-01-15 16:00:23', '2021-01-15 16:00:23', 'Active'),
(3, 0, 20, 'No', '2021-01-15 16:00:42', '2021-01-15 16:00:42', 'Active'),
(4, 0, 25, 'No', '2021-01-15 16:00:59', '2021-01-15 16:00:59', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `subscribe_now1`
--

CREATE TABLE `subscribe_now1` (
  `id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_no` bigint(10) NOT NULL,
  `age` int(5) NOT NULL,
  `gender` enum('Male','Female','Other') NOT NULL,
  `weight` int(10) NOT NULL,
  `height_in_feet` int(5) NOT NULL,
  `height_in_inches` int(5) NOT NULL,
  `physical_activity_id` int(10) NOT NULL,
  `avoid_or_dislike_food_id` varchar(255) NOT NULL,
  `other_food` varchar(100) NOT NULL,
  `total` float NOT NULL,
  `discount` float NOT NULL,
  `price` float NOT NULL,
  `food_precautions` text NOT NULL,
  `lifestyle_disease` text NOT NULL,
  `start_date` date NOT NULL,
  `subscribe_now_plan_id` int(10) NOT NULL,
  `subscribe_now_plan_duration_id` int(10) NOT NULL,
  `meal_type_id` varchar(255) NOT NULL,
  `address1` varchar(250) NOT NULL,
  `state1` varchar(100) NOT NULL,
  `city1` varchar(50) NOT NULL,
  `pincode1` varchar(6) NOT NULL,
  `address2` varchar(250) NOT NULL,
  `state2` varchar(100) NOT NULL,
  `city2` varchar(50) NOT NULL,
  `pincode2` varchar(6) NOT NULL,
  `is_deleted` enum('No','Yes') NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `session_id` varchar(255) NOT NULL,
  `subscription_id` varchar(55) NOT NULL,
  `comments` text NOT NULL,
  `link` varchar(255) NOT NULL,
  `approve_status` enum('Approve','Disapprove') NOT NULL,
  `payment_status` varchar(255) NOT NULL,
  `transaction_id` varchar(255) NOT NULL,
  `address1_meal` varchar(55) NOT NULL,
  `address2_meal` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `subscribe_now1`
--

INSERT INTO `subscribe_now1` (`id`, `name`, `email`, `phone_no`, `age`, `gender`, `weight`, `height_in_feet`, `height_in_inches`, `physical_activity_id`, `avoid_or_dislike_food_id`, `other_food`, `total`, `discount`, `price`, `food_precautions`, `lifestyle_disease`, `start_date`, `subscribe_now_plan_id`, `subscribe_now_plan_duration_id`, `meal_type_id`, `address1`, `state1`, `city1`, `pincode1`, `address2`, `state2`, `city2`, `pincode2`, `is_deleted`, `created_at`, `updated_at`, `session_id`, `subscription_id`, `comments`, `link`, `approve_status`, `payment_status`, `transaction_id`, `address1_meal`, `address2_meal`) VALUES
(3, 'Amira Dhivre', 'webdeveloper@techrupt.in', 8149678010, 25, 'Female', 55, 5, 2, 4, 'None', '', 6650, 350, 6982.5, '', '', '2021-01-20', 1, 1, '1,2,3,4', 'Nashik', '', '', '425413', '', '', '', '', 'No', '2021-01-18 12:24:38', '2021-01-18 12:24:38', 'ToGCDqeHjbkBqDnLxRAnANgAWd4vdCwdoD71jocP', '100525', '', '', 'Disapprove', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `subscribe_now_plan`
--

CREATE TABLE `subscribe_now_plan` (
  `subscribe_now_plan_id` int(11) NOT NULL,
  `subscribe_now_plan_name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_active` enum('1','0') NOT NULL DEFAULT '1',
  `is_deleted` enum('1','0') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `subscribe_now_plan`
--

INSERT INTO `subscribe_now_plan` (`subscribe_now_plan_id`, `subscribe_now_plan_name`, `created_at`, `updated_at`, `is_active`, `is_deleted`) VALUES
(1, 'Classic Plan', '2020-12-21 17:24:30', '2020-12-21 17:24:30', '1', '0');

-- --------------------------------------------------------

--
-- Table structure for table `subscribe_now_plan_duration`
--

CREATE TABLE `subscribe_now_plan_duration` (
  `subscribe_now_plan_duration_id` int(11) NOT NULL,
  `subscribe_now_plan_id` int(10) NOT NULL COMMENT 'PK referred by ''subscribe_now_plan''',
  `subscribe_discount_id` int(11) NOT NULL,
  `subscribe_now_duration` int(10) NOT NULL,
  `subscribe_now_price_per_meal` float(10,2) NOT NULL,
  `subscribe_now_pkg_price` float(10,2) NOT NULL,
  `is_active` enum('1','0') NOT NULL,
  `is_deleted` enum('1','0') NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `subscribe_now_plan_duration`
--

INSERT INTO `subscribe_now_plan_duration` (`subscribe_now_plan_duration_id`, `subscribe_now_plan_id`, `subscribe_discount_id`, `subscribe_now_duration`, `subscribe_now_price_per_meal`, `subscribe_now_pkg_price`, `is_active`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 7, 250.00, 0.00, '1', '0', '2020-12-21 17:25:01', '2020-12-21 17:25:01'),
(2, 1, 2, 15, 250.00, 0.00, '1', '0', '2020-12-21 17:25:36', '2020-12-21 17:25:36'),
(3, 1, 3, 30, 250.00, 0.00, '1', '0', '2020-12-21 17:26:30', '2020-12-21 17:26:30'),
(4, 1, 4, 60, 250.00, 0.00, '1', '0', '2020-12-21 17:27:26', '2020-12-21 17:27:26');

-- --------------------------------------------------------

--
-- Table structure for table `subscription`
--

CREATE TABLE `subscription` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` enum('Active','Inactive') NOT NULL,
  `is_deleted` enum('No','Yes') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subscription`
--

INSERT INTO `subscription` (`id`, `email`, `name`, `created_at`, `updated_at`, `status`, `is_deleted`) VALUES
(1, 'webdeveloper1@techrupt.in', '', '2020-09-05 16:25:57', '2020-09-05 16:25:57', 'Active', 'No'),
(2, 'webdeveloper1@techrupt.in', '', '2020-09-05 16:41:43', '2020-09-05 16:41:43', 'Active', 'No'),
(3, 'jandjleonhard@hotmail.com', '', '2020-09-08 10:36:47', '2020-09-08 10:36:47', 'Active', 'No'),
(4, 'urvashitikmani1310@gmail.com', '', '2020-09-10 12:52:54', '2020-09-10 12:52:54', 'Active', 'No'),
(5, 'srimanojdontamsetti@gmail.com', '', '2020-09-11 15:21:37', '2020-09-11 15:21:37', 'Active', 'No'),
(6, 'pradnyavraut82@gmail.com', '', '2020-09-12 21:52:37', '2020-09-12 21:52:37', 'Active', 'No'),
(7, 'nutridock.com@domstat.su', '', '2020-09-13 14:39:06', '2020-09-13 14:39:06', 'Active', 'No'),
(8, 'npiyaligupta@gmail.com', '', '2020-09-13 15:18:40', '2020-09-13 15:18:40', 'Active', 'No'),
(9, 'kunalnkm040@gmail.com', '', '2020-09-13 15:23:55', '2020-09-13 15:23:55', 'Active', 'No'),
(10, 'ddas88796@gmail.com', '', '2020-09-13 16:43:15', '2020-09-13 16:43:15', 'Active', 'No'),
(11, 'yashagohil26@gmail.com', '', '2020-09-13 20:43:06', '2020-09-13 20:43:06', 'Active', 'No'),
(12, 'pawankumarvishwakarma941@gmail.com', '', '2020-09-14 11:32:08', '2020-09-14 11:32:08', 'Active', 'No'),
(13, 'pawankumarvishwakarma941@gmail.com', '', '2020-09-14 11:33:14', '2020-09-14 11:33:14', 'Active', 'No'),
(14, 'pawankumarvishwakarma941@gmail.com', '', '2020-09-14 11:35:38', '2020-09-14 11:35:38', 'Active', 'No'),
(15, 'sidrasadaf19@gmail.com', '', '2020-09-15 00:58:07', '2020-09-15 00:58:07', 'Active', 'No'),
(16, 'pahalpatel243@gmail.com', '', '2020-09-15 16:15:23', '2020-09-15 16:15:23', 'Active', 'No'),
(17, 'jayupravin@gmail.com', '', '2020-09-17 23:23:22', '2020-09-17 23:23:22', 'Active', 'No'),
(18, 'jayupravin@gmail.com', '', '2020-09-17 23:23:29', '2020-09-17 23:23:29', 'Active', 'No'),
(19, '1111adityavishe@gmail.com', '', '2020-09-18 08:10:55', '2020-09-18 08:10:55', 'Active', 'No'),
(20, 'foodtech2312@gmail.com', '', '2020-09-18 16:02:17', '2020-09-18 16:02:17', 'Active', 'No'),
(21, 'akshayavino14@gmail.com', '', '2020-09-18 19:34:48', '2020-09-18 19:34:48', 'Active', 'No'),
(22, 'rohitagidwani@gmail.com', '', '2020-09-19 15:12:33', '2020-09-19 15:12:33', 'Active', 'No'),
(23, 'gdwesterman@msn.com', '', '2020-09-24 17:12:27', '2020-09-24 17:12:27', 'Active', 'No'),
(24, 'kanibwoy@gmail.com', '', '2020-09-24 18:43:27', '2020-09-24 18:43:27', 'Active', 'No'),
(25, 'desltech@aol.com', '', '2020-09-24 21:20:06', '2020-09-24 21:20:06', 'Active', 'No'),
(26, 'prov18prov@gmail.com', '', '2020-09-24 23:17:20', '2020-09-24 23:17:20', 'Active', 'No'),
(27, 'killers1965@gmail.com', '', '2020-09-25 00:20:03', '2020-09-25 00:20:03', 'Active', 'No'),
(28, 'ORGANSTP@AOL.COM', '', '2020-09-25 01:40:41', '2020-09-25 01:40:41', 'Active', 'No'),
(29, 'lbreak@aol.com', '', '2020-09-25 02:45:01', '2020-09-25 02:45:01', 'Active', 'No'),
(30, 'jenr830@aol.com', '', '2020-09-25 05:33:52', '2020-09-25 05:33:52', 'Active', 'No'),
(31, 'shosaini11@yahoo.com', '', '2020-09-25 09:04:04', '2020-09-25 09:04:04', 'Active', 'No'),
(32, 'florez.michele@gmail.com', '', '2020-09-25 10:31:26', '2020-09-25 10:31:26', 'Active', 'No'),
(33, 'torimiller91@yahoo.com', '', '2020-09-25 18:48:23', '2020-09-25 18:48:23', 'Active', 'No'),
(34, 'evelynjkim@gmail.com', '', '2020-09-25 20:06:47', '2020-09-25 20:06:47', 'Active', 'No'),
(35, 'ebay@myswooop.de', '', '2020-09-25 22:05:26', '2020-09-25 22:05:26', 'Active', 'No'),
(36, 'KMOSELEY@ec.rr.com', '', '2020-09-25 23:05:09', '2020-09-25 23:05:09', 'Active', 'No'),
(37, 'bahrnfuss@aol.com', '', '2020-09-25 23:15:37', '2020-09-25 23:15:37', 'Active', 'No'),
(38, 'jharband@sbcglobal.net', '', '2020-09-26 01:17:00', '2020-09-26 01:17:00', 'Active', 'No'),
(39, 'tatita_litoral@hotmail.com', '', '2020-09-26 07:44:30', '2020-09-26 07:44:30', 'Active', 'No'),
(40, 'evertracy@yahoo.com', '', '2020-09-26 10:30:02', '2020-09-26 10:30:02', 'Active', 'No'),
(41, 'sullivan.greenfield@gmail.com', '', '2020-09-26 11:02:59', '2020-09-26 11:02:59', 'Active', 'No'),
(42, 'steve_esser@bellsouth.net', '', '2020-09-26 14:51:59', '2020-09-26 14:51:59', 'Active', 'No'),
(43, 'alexk_24@yahoo.com.au', '', '2020-09-27 00:52:37', '2020-09-27 00:52:37', 'Active', 'No'),
(44, 'bsgroup1680@gmail.com', '', '2020-09-27 16:02:23', '2020-09-27 16:02:23', 'Active', 'No'),
(45, 'systakinjw@gmail.com', '', '2020-09-27 21:54:10', '2020-09-27 21:54:10', 'Active', 'No'),
(46, 'systakinjw@gmail.com', '', '2020-09-27 21:54:36', '2020-09-27 21:54:36', 'Active', 'No'),
(47, 'vstefurac@yahoo.com', '', '2020-09-28 01:00:56', '2020-09-28 01:00:56', 'Active', 'No'),
(48, 'ctboltrek@optonline.net', '', '2020-09-28 01:16:00', '2020-09-28 01:16:00', 'Active', 'No'),
(49, 'ruthpeikert@sbcglobal.net', '', '2020-09-28 01:24:28', '2020-09-28 01:24:28', 'Active', 'No'),
(50, 'neil@americandirect.tv', '', '2020-09-28 01:31:14', '2020-09-28 01:31:14', 'Active', 'No'),
(51, 'missbon28@gmail.com', '', '2020-09-28 04:40:36', '2020-09-28 04:40:36', 'Active', 'No'),
(52, 'missbon28@gmail.com', '', '2020-09-28 04:40:40', '2020-09-28 04:40:40', 'Active', 'No'),
(53, 'robert@robertestep.net', '', '2020-09-28 07:41:56', '2020-09-28 07:41:56', 'Active', 'No'),
(54, 'smsloan01@gmail.com', '', '2020-09-28 10:54:17', '2020-09-28 10:54:17', 'Active', 'No'),
(55, 'smsloan01@gmail.com', '', '2020-09-28 10:54:18', '2020-09-28 10:54:18', 'Active', 'No'),
(56, 'padoheny59@gmail.com', '', '2020-09-28 16:51:53', '2020-09-28 16:51:53', 'Active', 'No'),
(57, 'padoheny59@gmail.com', '', '2020-09-28 16:51:55', '2020-09-28 16:51:55', 'Active', 'No'),
(58, 'dcohen08@comcast.net', '', '2020-09-28 20:26:46', '2020-09-28 20:26:46', 'Active', 'No'),
(59, 'unalewis9101@comcast.net', '', '2020-09-28 22:29:41', '2020-09-28 22:29:41', 'Active', 'No'),
(60, 'ktastv@fix.net', '', '2020-09-28 23:22:10', '2020-09-28 23:22:10', 'Active', 'No'),
(61, 'dstraus71@gmail.com', '', '2020-09-29 02:47:20', '2020-09-29 02:47:20', 'Active', 'No'),
(62, 'dstraus71@gmail.com', '', '2020-09-29 02:47:23', '2020-09-29 02:47:23', 'Active', 'No'),
(63, 'latanya.cocciardimilne@yahoo.com', '', '2020-09-29 03:27:54', '2020-09-29 03:27:54', 'Active', 'No'),
(64, 'latanya.cocciardimilne@yahoo.com', '', '2020-09-29 03:27:59', '2020-09-29 03:27:59', 'Active', 'No'),
(65, 'ebrand@gocitywide.com', '', '2020-09-29 04:05:57', '2020-09-29 04:05:57', 'Active', 'No'),
(66, 'ebrand@gocitywide.com', '', '2020-09-29 04:06:00', '2020-09-29 04:06:00', 'Active', 'No'),
(67, 'alregerkc@msn.com', '', '2020-09-29 05:08:07', '2020-09-29 05:08:07', 'Active', 'No'),
(68, 'tom_156@hotmail.co.uk', '', '2020-09-29 06:15:30', '2020-09-29 06:15:30', 'Active', 'No'),
(69, 'cheretom@gmail.com', '', '2020-09-29 06:43:39', '2020-09-29 06:43:39', 'Active', 'No'),
(70, 'cheretom@gmail.com', '', '2020-09-29 06:43:42', '2020-09-29 06:43:42', 'Active', 'No'),
(71, 'kegodaniel@gmail.com', '', '2020-09-29 07:44:34', '2020-09-29 07:44:34', 'Active', 'No'),
(72, 'DILLPICKLESON@YAHOO.COM', '', '2020-09-29 11:24:38', '2020-09-29 11:24:38', 'Active', 'No'),
(73, '47.30bud@gmail.com', '', '2020-09-29 13:26:07', '2020-09-29 13:26:07', 'Active', 'No'),
(74, 'panatc206@gmail.com', '', '2020-09-29 16:03:27', '2020-09-29 16:03:27', 'Active', 'No'),
(75, 'panatc206@gmail.com', '', '2020-09-29 16:03:28', '2020-09-29 16:03:28', 'Active', 'No'),
(76, 'jfsnmc@aol.com', '', '2020-09-29 16:05:30', '2020-09-29 16:05:30', 'Active', 'No'),
(77, 'marleyblenkins@live.co.uk', '', '2020-09-29 19:01:14', '2020-09-29 19:01:14', 'Active', 'No'),
(78, 'wendy.c.chen@rbc.com', '', '2020-09-29 21:07:50', '2020-09-29 21:07:50', 'Active', 'No'),
(79, 'wendy.c.chen@rbc.com', '', '2020-09-29 21:07:54', '2020-09-29 21:07:54', 'Active', 'No'),
(80, 'ruthie0724@gmail.com', '', '2020-09-29 21:27:47', '2020-09-29 21:27:47', 'Active', 'No'),
(81, 'ruthie0724@gmail.com', '', '2020-09-29 21:27:50', '2020-09-29 21:27:50', 'Active', 'No'),
(82, 'emmabade@aol.com', '', '2020-09-29 23:48:08', '2020-09-29 23:48:08', 'Active', 'No'),
(83, 'JEFFVGRAHAM@GMAIL.COM', '', '2020-09-30 00:04:34', '2020-09-30 00:04:34', 'Active', 'No'),
(84, 'brooksidecog@gmail.com', '', '2020-09-30 00:49:34', '2020-09-30 00:49:34', 'Active', 'No'),
(85, 'PBERLIN@METROCAST.NET', '', '2020-09-30 01:03:25', '2020-09-30 01:03:25', 'Active', 'No'),
(86, 'wbzhang01@gmail.com', '', '2020-09-30 01:11:11', '2020-09-30 01:11:11', 'Active', 'No'),
(87, 'alvaroalvarez_92@yahoo.com', '', '2020-09-30 01:17:01', '2020-09-30 01:17:01', 'Active', 'No'),
(88, 'KRISHNA.SAI696@GMAIL.COM', '', '2020-09-30 01:25:55', '2020-09-30 01:25:55', 'Active', 'No'),
(89, 'AIDAN.BOLAND@YAHOO.COM', '', '2020-09-30 01:32:30', '2020-09-30 01:32:30', 'Active', 'No'),
(90, 'jmaybs01@yahoo.com', '', '2020-09-30 01:40:52', '2020-09-30 01:40:52', 'Active', 'No'),
(91, 'brad@brooksidecog.com', '', '2020-09-30 01:46:47', '2020-09-30 01:46:47', 'Active', 'No'),
(92, 'slaves.andre@gmail.com', '', '2020-09-30 02:00:47', '2020-09-30 02:00:47', 'Active', 'No'),
(93, 'CARMELINABAKER@GMAIL.COM', '', '2020-09-30 02:24:21', '2020-09-30 02:24:21', 'Active', 'No'),
(94, 'sherisimon0@gmail.com', '', '2020-09-30 02:47:41', '2020-09-30 02:47:41', 'Active', 'No'),
(95, 'sherisimon0@gmail.com', '', '2020-09-30 02:47:42', '2020-09-30 02:47:42', 'Active', 'No'),
(96, 'chinnisaialimali@gmail.com', '', '2020-09-30 02:56:41', '2020-09-30 02:56:41', 'Active', 'No'),
(97, 'GMBRIPPY@ATT.NET', '', '2020-09-30 03:41:49', '2020-09-30 03:41:49', 'Active', 'No'),
(98, 'Nipomodreamer@att.net', '', '2020-09-30 04:24:54', '2020-09-30 04:24:54', 'Active', 'No'),
(99, 'kcateswessel@gmail.com', '', '2020-09-30 04:44:06', '2020-09-30 04:44:06', 'Active', 'No'),
(100, 'kcateswessel@gmail.com', '', '2020-09-30 04:44:08', '2020-09-30 04:44:08', 'Active', 'No'),
(101, 'alfredo102074@hotmail.com', '', '2020-09-30 05:57:07', '2020-09-30 05:57:07', 'Active', 'No'),
(102, 'torasinc@gmail.com', '', '2020-09-30 06:32:35', '2020-09-30 06:32:35', 'Active', 'No'),
(103, 'upwimt@yahoo.com', '', '2020-09-30 06:58:55', '2020-09-30 06:58:55', 'Active', 'No'),
(104, 'mat3trit@gmail.com', '', '2020-09-30 07:19:50', '2020-09-30 07:19:50', 'Active', 'No'),
(105, 'shadowlink4885@gmail.com', '', '2020-09-30 10:27:04', '2020-09-30 10:27:04', 'Active', 'No'),
(106, 'mrtebinc@gmail.com', '', '2020-09-30 12:43:37', '2020-09-30 12:43:37', 'Active', 'No'),
(107, 'mrtebinc@gmail.com', '', '2020-09-30 12:43:39', '2020-09-30 12:43:39', 'Active', 'No'),
(108, 'michael@nycom.com', '', '2020-09-30 13:49:00', '2020-09-30 13:49:00', 'Active', 'No'),
(109, 'michael@nycom.com', '', '2020-09-30 13:49:02', '2020-09-30 13:49:02', 'Active', 'No'),
(110, 'david.a.leight@gmail.com', '', '2020-09-30 13:59:41', '2020-09-30 13:59:41', 'Active', 'No'),
(111, 'pastorted@portagecag.org', '', '2020-09-30 16:48:04', '2020-09-30 16:48:04', 'Active', 'No'),
(112, 'upwimt@yahoo.com', '', '2020-09-30 17:01:03', '2020-09-30 17:01:03', 'Active', 'No'),
(113, 'smithtom9876@gmail.com', '', '2020-09-30 17:21:07', '2020-09-30 17:21:07', 'Active', 'No'),
(114, 'smithtom9876@gmail.com', '', '2020-09-30 17:21:10', '2020-09-30 17:21:10', 'Active', 'No'),
(115, 'allenp001@hawaii.rr.com', '', '2020-09-30 18:10:59', '2020-09-30 18:10:59', 'Active', 'No'),
(116, 'christina.miller.502@gmail.com', '', '2020-09-30 21:37:28', '2020-09-30 21:37:28', 'Active', 'No'),
(117, 'mojohess@tiscali.co.uk', '', '2020-09-30 22:02:14', '2020-09-30 22:02:14', 'Active', 'No'),
(118, 'tammylaraine@hotmail.com', '', '2020-09-30 22:11:32', '2020-09-30 22:11:32', 'Active', 'No'),
(119, 'crellinaj@aol.co.uk', '', '2020-09-30 22:18:48', '2020-09-30 22:18:48', 'Active', 'No'),
(120, 'ah51416@yahoo.com', '', '2020-09-30 23:25:32', '2020-09-30 23:25:32', 'Active', 'No'),
(121, 'tracy@photomugs.com', '', '2020-09-30 23:47:03', '2020-09-30 23:47:03', 'Active', 'No'),
(122, 'tracy@photomugs.com', '', '2020-09-30 23:47:10', '2020-09-30 23:47:10', 'Active', 'No'),
(123, 'jonathansusanto98@hotmail.com', '', '2020-09-30 23:50:38', '2020-09-30 23:50:38', 'Active', 'No'),
(124, 'jonathansusanto98@hotmail.com', '', '2020-09-30 23:50:44', '2020-09-30 23:50:44', 'Active', 'No'),
(125, 'stalks_1110@yahoo.com', '', '2020-10-01 00:08:03', '2020-10-01 00:08:03', 'Active', 'No'),
(126, 'carleepolster@gmail.com', '', '2020-10-01 00:11:17', '2020-10-01 00:11:17', 'Active', 'No'),
(127, 'carleepolster@gmail.com', '', '2020-10-01 00:11:49', '2020-10-01 00:11:49', 'Active', 'No'),
(128, 'petpyrs@surewest.net', '', '2020-10-01 00:32:37', '2020-10-01 00:32:37', 'Active', 'No'),
(129, 'olsmith718@gmail.com', '', '2020-10-01 01:50:31', '2020-10-01 01:50:31', 'Active', 'No'),
(130, 'ruthie0724@gmail.com', '', '2020-10-01 02:11:21', '2020-10-01 02:11:21', 'Active', 'No'),
(131, 'ruthie0724@gmail.com', '', '2020-10-01 02:11:23', '2020-10-01 02:11:23', 'Active', 'No'),
(132, 'hmickol@wi.rr.com', '', '2020-10-01 02:17:26', '2020-10-01 02:17:26', 'Active', 'No'),
(133, 'jdublanko@gmail.com', '', '2020-10-01 03:01:41', '2020-10-01 03:01:41', 'Active', 'No'),
(134, 'cshah@wellspan.org', '', '2020-10-01 04:18:20', '2020-10-01 04:18:20', 'Active', 'No'),
(135, 'dhlovet@clemson.edu', '', '2020-10-01 04:37:06', '2020-10-01 04:37:06', 'Active', 'No'),
(136, 'dhlovet@clemson.edu', '', '2020-10-01 04:37:08', '2020-10-01 04:37:08', 'Active', 'No'),
(137, 'ladide81@gmail.com', '', '2020-10-01 05:16:59', '2020-10-01 05:16:59', 'Active', 'No'),
(138, 'ladide81@gmail.com', '', '2020-10-01 05:17:01', '2020-10-01 05:17:01', 'Active', 'No'),
(139, 'bobmilano@hotmail.com', '', '2020-10-01 05:31:52', '2020-10-01 05:31:52', 'Active', 'No'),
(140, 'mat3trit@gmail.com', '', '2020-10-01 07:10:30', '2020-10-01 07:10:30', 'Active', 'No'),
(141, 'mmaley@ptd.net', '', '2020-10-01 07:23:28', '2020-10-01 07:23:28', 'Active', 'No'),
(142, 'mandi120387@gmail.com', '', '2020-10-01 07:26:11', '2020-10-01 07:26:11', 'Active', 'No'),
(143, 'pastorted@portagecag.org', '', '2020-10-01 08:04:21', '2020-10-01 08:04:21', 'Active', 'No'),
(144, 'benc007@yahoo.com', '', '2020-10-01 08:13:36', '2020-10-01 08:13:36', 'Active', 'No'),
(145, 'kcateswessel@gmail.com', '', '2020-10-01 11:25:11', '2020-10-01 11:25:11', 'Active', 'No'),
(146, 'kcateswessel@gmail.com', '', '2020-10-01 11:25:13', '2020-10-01 11:25:13', 'Active', 'No'),
(147, 'kristy.joyce@blueyonder.co.uk', '', '2020-10-01 11:28:06', '2020-10-01 11:28:06', 'Active', 'No'),
(148, 'tiadavis1987@gmail.com', '', '2020-10-01 14:50:55', '2020-10-01 14:50:55', 'Active', 'No'),
(149, 'tiadavis1987@gmail.com', '', '2020-10-01 14:50:56', '2020-10-01 14:50:56', 'Active', 'No'),
(150, 'taefancemen8827@yahoo.com', '', '2020-10-01 16:49:33', '2020-10-01 16:49:33', 'Active', 'No'),
(151, 'taefancemen8827@yahoo.com', '', '2020-10-01 16:49:34', '2020-10-01 16:49:34', 'Active', 'No'),
(152, 'mariodinola@alice.it', '', '2020-10-01 17:05:00', '2020-10-01 17:05:00', 'Active', 'No'),
(153, 'cpetty1283@hotmail.com', '', '2020-10-01 18:06:01', '2020-10-01 18:06:01', 'Active', 'No'),
(154, 'acmerlo77@gmail.com', '', '2020-10-01 19:08:03', '2020-10-01 19:08:03', 'Active', 'No'),
(155, 's.bennie@sky.com', '', '2020-10-01 20:11:05', '2020-10-01 20:11:05', 'Active', 'No'),
(156, 'bluewater305fl@gmail.com', '', '2020-10-01 20:25:31', '2020-10-01 20:25:31', 'Active', 'No'),
(157, 'bluewater305fl@gmail.com', '', '2020-10-01 20:25:32', '2020-10-01 20:25:32', 'Active', 'No'),
(158, 'klh1408@gmail.com', '', '2020-10-01 21:28:13', '2020-10-01 21:28:13', 'Active', 'No'),
(159, 'klh1408@gmail.com', '', '2020-10-01 21:28:14', '2020-10-01 21:28:14', 'Active', 'No'),
(160, 'charleypark82@hotmail.com', '', '2020-10-01 21:46:09', '2020-10-01 21:46:09', 'Active', 'No'),
(161, 'MICHAELDUFOUR1@GMAIL.COM', '', '2020-10-01 22:25:38', '2020-10-01 22:25:38', 'Active', 'No'),
(162, 'jrsoundman1@comcast.net', '', '2020-10-01 22:52:09', '2020-10-01 22:52:09', 'Active', 'No'),
(163, 'realynevans@icloud.com', '', '2020-10-01 23:10:49', '2020-10-01 23:10:49', 'Active', 'No'),
(164, 'realynevans@icloud.com', '', '2020-10-01 23:10:51', '2020-10-01 23:10:51', 'Active', 'No'),
(165, 'henrymahl@aol.com', '', '2020-10-01 23:31:32', '2020-10-01 23:31:32', 'Active', 'No'),
(166, 'finaltouchli@outlook.com', '', '2020-10-01 23:40:35', '2020-10-01 23:40:35', 'Active', 'No'),
(167, 'finaltouchli@outlook.com', '', '2020-10-01 23:40:40', '2020-10-01 23:40:40', 'Active', 'No'),
(168, 'cbw305@yahoo.com', '', '2020-10-01 23:47:56', '2020-10-01 23:47:56', 'Active', 'No'),
(169, 'gaddiscd@gmail.com', '', '2020-10-02 03:25:24', '2020-10-02 03:25:24', 'Active', 'No'),
(170, 'WEIMERBILL@GMAIL.COM', '', '2020-10-02 03:31:20', '2020-10-02 03:31:20', 'Active', 'No'),
(171, 'ferlincross@btopenworld.com', '', '2020-10-02 04:32:00', '2020-10-02 04:32:00', 'Active', 'No'),
(172, 'cbw305@yahoo.com', '', '2020-10-02 04:43:49', '2020-10-02 04:43:49', 'Active', 'No'),
(173, 'attrablevedw@gmail.com', '', '2020-10-02 05:21:06', '2020-10-02 05:21:06', 'Active', 'No'),
(174, 'attrablevedw@gmail.com', '', '2020-10-02 05:21:08', '2020-10-02 05:21:08', 'Active', 'No'),
(175, 'Urmy23@gmail.com', '', '2020-10-02 06:05:07', '2020-10-02 06:05:07', 'Active', 'No'),
(176, 'operationsemail@gmail.com', '', '2020-10-02 07:53:51', '2020-10-02 07:53:51', 'Active', 'No'),
(177, 'operationsemail@gmail.com', '', '2020-10-02 07:54:00', '2020-10-02 07:54:00', 'Active', 'No'),
(178, 'cunninghammary31@gmail.com', '', '2020-10-02 08:33:34', '2020-10-02 08:33:34', 'Active', 'No'),
(179, 'tshultz_99@yahoo.com', '', '2020-10-02 09:08:33', '2020-10-02 09:08:33', 'Active', 'No'),
(180, 'adsharp2211@gmail.com', '', '2020-10-02 11:12:09', '2020-10-02 11:12:09', 'Active', 'No'),
(181, 'noemie@signaturepro.ca', '', '2020-10-02 11:59:23', '2020-10-02 11:59:23', 'Active', 'No'),
(182, 'bruj@comcast.net', '', '2020-10-02 12:26:45', '2020-10-02 12:26:45', 'Active', 'No'),
(183, 'bruj@comcast.net', '', '2020-10-02 12:26:47', '2020-10-02 12:26:47', 'Active', 'No'),
(184, 'andyshin89@gmail.com', '', '2020-10-02 13:45:30', '2020-10-02 13:45:30', 'Active', 'No'),
(185, 'natalieyoungs1117@icloud.com', '', '2020-10-02 19:33:37', '2020-10-02 19:33:37', 'Active', 'No'),
(186, 'natalieyoungs1117@icloud.com', '', '2020-10-02 19:33:38', '2020-10-02 19:33:38', 'Active', 'No'),
(187, 'yeo19s@hanmail.net', '', '2020-10-02 19:34:45', '2020-10-02 19:34:45', 'Active', 'No'),
(188, 'sarahjaynedunne@virginmedia.com', '', '2020-10-02 21:36:41', '2020-10-02 21:36:41', 'Active', 'No'),
(189, 'ernesca2@hotmail.com', '', '2020-10-02 22:16:01', '2020-10-02 22:16:01', 'Active', 'No'),
(190, 'ernesca2@hotmail.com', '', '2020-10-02 22:16:03', '2020-10-02 22:16:03', 'Active', 'No'),
(191, 'ulabmetli7981@yahoo.com', '', '2020-10-02 23:27:00', '2020-10-02 23:27:00', 'Active', 'No'),
(192, 'ulabmetli7981@yahoo.com', '', '2020-10-02 23:27:03', '2020-10-02 23:27:03', 'Active', 'No'),
(193, 'purchasing@capitalbooksandwellness.com', '', '2020-10-02 23:35:33', '2020-10-02 23:35:33', 'Active', 'No'),
(194, 'purchasing@capitalbooksandwellness.com', '', '2020-10-02 23:35:36', '2020-10-02 23:35:36', 'Active', 'No'),
(195, 'stalks_1110@yahoo.com', '', '2020-10-02 23:43:20', '2020-10-02 23:43:20', 'Active', 'No'),
(196, 'skylarstampley07@gmail.com', '', '2020-10-03 00:04:06', '2020-10-03 00:04:06', 'Active', 'No'),
(197, 'skylarstampley07@gmail.com', '', '2020-10-03 00:04:10', '2020-10-03 00:04:10', 'Active', 'No'),
(198, 'yolanda.schultz@hotmail.com', '', '2020-10-03 00:40:56', '2020-10-03 00:40:56', 'Active', 'No'),
(199, 'sersuctile8189@yahoo.com', '', '2020-10-03 01:37:34', '2020-10-03 01:37:34', 'Active', 'No'),
(200, 'sersuctile8189@yahoo.com', '', '2020-10-03 01:37:36', '2020-10-03 01:37:36', 'Active', 'No'),
(201, 'purchasing@capitalbooksandwellness.com', '', '2020-10-03 01:55:46', '2020-10-03 01:55:46', 'Active', 'No'),
(202, 'purchasing@capitalbooksandwellness.com', '', '2020-10-03 01:55:48', '2020-10-03 01:55:48', 'Active', 'No'),
(203, 'gm_adrian@msn.com', '', '2020-10-03 04:56:04', '2020-10-03 04:56:04', 'Active', 'No'),
(204, 'gm_adrian@msn.com', '', '2020-10-03 04:56:06', '2020-10-03 04:56:06', 'Active', 'No'),
(205, 'julie.wolfe@btinternet.com', '', '2020-10-03 05:59:52', '2020-10-03 05:59:52', 'Active', 'No'),
(206, 'lwesterman1966@gmail.com', '', '2020-10-03 08:24:51', '2020-10-03 08:24:51', 'Active', 'No'),
(207, 'lwesterman1966@gmail.com', '', '2020-10-03 08:24:52', '2020-10-03 08:24:52', 'Active', 'No'),
(208, 'operationsemail@gmail.com', '', '2020-10-03 08:57:15', '2020-10-03 08:57:15', 'Active', 'No'),
(209, 'operationsemail@gmail.com', '', '2020-10-03 08:57:16', '2020-10-03 08:57:16', 'Active', 'No'),
(224, 'webdeveloper1@techrupt.in', '', '2020-10-03 17:54:10', '2020-10-03 17:54:10', 'Active', 'No'),
(225, 'webdeveloper1@techrupt.in', '', '2020-10-03 17:56:19', '2020-10-03 17:56:19', 'Active', 'No'),
(226, 'webdeveloper1@techrupt.in', '', '2020-10-03 18:16:04', '2020-10-03 18:16:04', 'Active', 'No'),
(229, 'webdeveloper1@techrupt.in', '', '2020-10-03 18:47:02', '2020-10-03 18:47:02', 'Active', 'No'),
(230, 'webdeveloper1@techrupt.in', '', '2020-10-03 18:50:10', '2020-10-03 18:50:10', 'Active', 'No'),
(231, 'urvashitikmani1310@gmail.com', '', '2020-10-03 18:54:15', '2020-10-03 18:54:15', 'Active', 'No'),
(232, 'sneh_tikmani@yahoo.com', '', '2020-10-03 18:56:25', '2020-10-03 18:56:25', 'Active', 'No'),
(233, 'urutikmani@gmail.com', '', '2020-10-03 18:57:04', '2020-10-03 18:57:04', 'Active', 'No'),
(234, 'marketing@nutridock.com', '', '2020-10-03 18:59:38', '2020-10-03 18:59:38', 'Active', 'No'),
(235, 'operationsemail@gmail.com', '', '2020-10-03 21:52:06', '2020-10-03 21:52:06', 'Active', 'No'),
(236, 'operationsemail@gmail.com', '', '2020-10-03 21:52:07', '2020-10-03 21:52:07', 'Active', 'No'),
(237, 'jlund112@windstream.net', '', '2020-10-03 22:45:41', '2020-10-03 22:45:41', 'Active', 'No'),
(238, 'jlund112@windstream.net', '', '2020-10-03 22:45:43', '2020-10-03 22:45:43', 'Active', 'No'),
(239, 'flovi90200@gmail.com', '', '2020-10-03 23:32:31', '2020-10-03 23:32:31', 'Active', 'No'),
(240, 'KRISHNA.SAI696@GMAIL.COM', '', '2020-10-04 00:45:05', '2020-10-04 00:45:05', 'Active', 'No'),
(241, 'isaiahclark1@hotmail.com', '', '2020-10-04 03:06:42', '2020-10-04 03:06:42', 'Active', 'No'),
(242, 'myhardship@gmx.de', '', '2020-10-04 06:25:25', '2020-10-04 06:25:25', 'Active', 'No'),
(243, 'tanyacopeland1@yahoo.com', '', '2020-10-04 06:49:08', '2020-10-04 06:49:08', 'Active', 'No'),
(244, 'ptgay49@gmail.com', '', '2020-10-04 08:02:07', '2020-10-04 08:02:07', 'Active', 'No'),
(245, 'ptgay49@gmail.com', '', '2020-10-04 08:02:09', '2020-10-04 08:02:09', 'Active', 'No'),
(246, 'luigistritip@gmail.com', '', '2020-10-04 08:30:41', '2020-10-04 08:30:41', 'Active', 'No'),
(247, 'roebuck1970@hotmail.co.uk', '', '2020-10-04 17:33:20', '2020-10-04 17:33:20', 'Active', 'No'),
(248, 'gscott5@sio.midco.net', '', '2020-10-04 20:44:17', '2020-10-04 20:44:17', 'Active', 'No'),
(249, 'clifeclear@yahoo.com', '', '2020-10-04 20:51:42', '2020-10-04 20:51:42', 'Active', 'No'),
(250, 'thudson42@hotmail.com', '', '2020-10-05 00:26:50', '2020-10-05 00:26:50', 'Active', 'No'),
(251, 'thudson42@hotmail.com', '', '2020-10-05 00:26:52', '2020-10-05 00:26:52', 'Active', 'No'),
(252, 'spearhunter2422@gmail.com', '', '2020-10-05 03:31:28', '2020-10-05 03:31:28', 'Active', 'No'),
(253, 'gideon4@hotmail.co.uk', '', '2020-10-05 04:43:02', '2020-10-05 04:43:02', 'Active', 'No'),
(255, 'guybrittcrm@gmail.com', '', '2020-10-05 06:15:46', '2020-10-05 06:15:46', 'Active', 'No'),
(256, 'km_classo11@yahoo.com', '', '2020-10-05 10:26:39', '2020-10-05 10:26:39', 'Active', 'No'),
(257, 'taminokinshitsu@gmail.com', '', '2020-10-05 11:40:48', '2020-10-05 11:40:48', 'Active', 'No'),
(259, 'urvashitikmani1310@gmail.com', '', '2020-10-05 12:22:06', '2020-10-05 12:22:06', 'Active', 'No'),
(260, 'urvashitikmani1310@gmail.com', '', '2020-10-05 12:24:28', '2020-10-05 12:24:28', 'Active', 'No'),
(261, 'urvashitikmani1310@gmail.com', '', '2020-10-05 12:31:13', '2020-10-05 12:31:13', 'Active', 'No'),
(262, 'urutikmani@gmail.com', '', '2020-10-05 12:35:16', '2020-10-05 12:35:16', 'Active', 'No'),
(263, 'pahalpatel243@gmail.com', '', '2020-10-05 13:13:39', '2020-10-05 13:13:39', 'Active', 'No'),
(264, 'lilpremee123@gmail.com', '', '2020-10-05 14:00:57', '2020-10-05 14:00:57', 'Active', 'No'),
(265, 'jamiesahouria@hotmail.com', '', '2020-10-05 19:52:12', '2020-10-05 19:52:12', 'Active', 'No'),
(266, 'jfsnmc@aol.com', '', '2020-10-05 21:40:07', '2020-10-05 21:40:07', 'Active', 'No'),
(267, 'mrd@dufourlawfirm.com', '', '2020-10-05 21:43:40', '2020-10-05 21:43:40', 'Active', 'No'),
(268, 'gcland@hotmail.com', '', '2020-10-05 23:19:33', '2020-10-05 23:19:33', 'Active', 'No'),
(269, 'gcland@hotmail.com', '', '2020-10-05 23:19:35', '2020-10-05 23:19:35', 'Active', 'No'),
(270, 'tomosucevic@gmail.com', '', '2020-10-05 23:56:18', '2020-10-05 23:56:18', 'Active', 'No'),
(271, 'tomosucevic@gmail.com', '', '2020-10-05 23:56:20', '2020-10-05 23:56:20', 'Active', 'No'),
(272, 'matilda2006@alice.it', '', '2020-10-06 00:30:31', '2020-10-06 00:30:31', 'Active', 'No'),
(273, 'kswany@rapidconstmgnt.com', '', '2020-10-06 00:32:45', '2020-10-06 00:32:45', 'Active', 'No'),
(274, 'kswany@rapidconstmgnt.com', '', '2020-10-06 00:32:48', '2020-10-06 00:32:48', 'Active', 'No'),
(275, 'szumilo@aol.com', '', '2020-10-06 02:22:39', '2020-10-06 02:22:39', 'Active', 'No'),
(276, 'VANESSABOG@AOL.COM', '', '2020-10-06 03:02:34', '2020-10-06 03:02:34', 'Active', 'No'),
(277, 'legacydragon@gmail.com', '', '2020-10-06 03:31:30', '2020-10-06 03:31:30', 'Active', 'No'),
(278, 'bwalsh@allbridge.com', '', '2020-10-06 04:04:05', '2020-10-06 04:04:05', 'Active', 'No'),
(279, 'bwalsh@allbridge.com', '', '2020-10-06 04:04:07', '2020-10-06 04:04:07', 'Active', 'No'),
(280, 'jan.martinez@csueastbay.edu', '', '2020-10-06 04:06:30', '2020-10-06 04:06:30', 'Active', 'No'),
(281, 'cjahunter@hotmail.com', '', '2020-10-06 08:41:31', '2020-10-06 08:41:31', 'Active', 'No'),
(282, 'kidstoothdoctor@gmail.com', '', '2020-10-06 12:19:48', '2020-10-06 12:19:48', 'Active', 'No'),
(283, 'dianas1505@yahoo.co.uk', '', '2020-10-06 15:51:43', '2020-10-06 15:51:43', 'Active', 'No'),
(284, 'yassin.bouaziz@hotmail.fr', '', '2020-10-06 17:13:55', '2020-10-06 17:13:55', 'Active', 'No'),
(285, 'r-sabo@t-online.de', '', '2020-10-06 17:59:46', '2020-10-06 17:59:46', 'Active', 'No'),
(286, 'mr.darryl.williams@gmail.com', '', '2020-10-06 18:58:23', '2020-10-06 18:58:23', 'Active', 'No'),
(287, 'mr.darryl.williams@gmail.com', '', '2020-10-06 18:58:24', '2020-10-06 18:58:24', 'Active', 'No'),
(288, 'nicksyt7@gmail.com', '', '2020-10-06 21:01:51', '2020-10-06 21:01:51', 'Active', 'No'),
(289, 'leonardoassene@gmail.com', '', '2020-10-06 22:17:02', '2020-10-06 22:17:02', 'Active', 'No'),
(290, 'leonardoassene@gmail.com', '', '2020-10-06 22:17:04', '2020-10-06 22:17:04', 'Active', 'No'),
(291, 'albates2@yahoo.com', '', '2020-10-07 00:06:54', '2020-10-07 00:06:54', 'Active', 'No'),
(292, 'acudoctor1@aol.com', '', '2020-10-07 00:12:00', '2020-10-07 00:12:00', 'Active', 'No'),
(293, 'mahon.young@yahoo.com', '', '2020-10-07 00:14:42', '2020-10-07 00:14:42', 'Active', 'No'),
(294, 'mahon.young@yahoo.com', '', '2020-10-07 00:14:44', '2020-10-07 00:14:44', 'Active', 'No'),
(295, 'todd@toddsmarine.com', '', '2020-10-07 00:58:47', '2020-10-07 00:58:47', 'Active', 'No'),
(296, 'emmacias@cpp.edu', '', '2020-10-07 06:18:02', '2020-10-07 06:18:02', 'Active', 'No'),
(297, 'k_oneill22@yahoo.com', '', '2020-10-07 08:22:06', '2020-10-07 08:22:06', 'Active', 'No'),
(298, 'gene.barrett@knology.net', '', '2020-10-07 12:21:02', '2020-10-07 12:21:02', 'Active', 'No'),
(299, 'gene.barrett@knology.net', '', '2020-10-07 12:21:04', '2020-10-07 12:21:04', 'Active', 'No'),
(300, 'rich@grace-efca.org', '', '2020-10-07 13:24:34', '2020-10-07 13:24:34', 'Active', 'No'),
(301, 'nisttusiria5772@yahoo.com', '', '2020-10-07 13:33:35', '2020-10-07 13:33:35', 'Active', 'No'),
(302, 'nisttusiria5772@yahoo.com', '', '2020-10-07 13:33:40', '2020-10-07 13:33:40', 'Active', 'No'),
(303, 'karvid540@comcast.net', '', '2020-10-07 14:13:29', '2020-10-07 14:13:29', 'Active', 'No'),
(304, 'karvid540@comcast.net', '', '2020-10-07 14:13:32', '2020-10-07 14:13:32', 'Active', 'No'),
(305, 'metadiaro7020@yahoo.com', '', '2020-10-07 14:32:04', '2020-10-07 14:32:04', 'Active', 'No'),
(306, 'metadiaro7020@yahoo.com', '', '2020-10-07 14:32:06', '2020-10-07 14:32:06', 'Active', 'No'),
(307, 'faustoilliano@aol.com', '', '2020-10-07 15:09:34', '2020-10-07 15:09:34', 'Active', 'No'),
(308, 'vaclicupie3962@yahoo.com', '', '2020-10-07 16:14:03', '2020-10-07 16:14:03', 'Active', 'No'),
(309, 'vaclicupie3962@yahoo.com', '', '2020-10-07 16:14:05', '2020-10-07 16:14:05', 'Active', 'No'),
(310, 'slowens1212@gmail.com', '', '2020-10-07 18:31:58', '2020-10-07 18:31:58', 'Active', 'No'),
(311, 'slowens1212@gmail.com', '', '2020-10-07 18:32:00', '2020-10-07 18:32:00', 'Active', 'No'),
(312, 'matin_87@yahoo.com', '', '2020-10-07 20:20:56', '2020-10-07 20:20:56', 'Active', 'No'),
(313, 'lauren.baker33@gmail.com', '', '2020-10-07 20:36:24', '2020-10-07 20:36:24', 'Active', 'No'),
(314, 'cigallagher1950@gmail.com', '', '2020-10-07 21:06:44', '2020-10-07 21:06:44', 'Active', 'No'),
(315, 'cpamichael62@gmail.com', '', '2020-10-07 22:19:26', '2020-10-07 22:19:26', 'Active', 'No'),
(316, 'cpamichael62@gmail.com', '', '2020-10-07 22:19:30', '2020-10-07 22:19:30', 'Active', 'No'),
(317, 'khalifmontgomery1@gmail.com', '', '2020-10-08 00:50:33', '2020-10-08 00:50:33', 'Active', 'No'),
(318, 'm_v_patterson@hotmail.com', '', '2020-10-08 01:10:30', '2020-10-08 01:10:30', 'Active', 'No'),
(319, 'superdanfong@yahoo.com', '', '2020-10-08 01:24:11', '2020-10-08 01:24:11', 'Active', 'No'),
(320, 'chinnisaialimali@gmail.com', '', '2020-10-08 02:11:14', '2020-10-08 02:11:14', 'Active', 'No'),
(321, 'tcollins653@yahoo.com', '', '2020-10-08 04:02:34', '2020-10-08 04:02:34', 'Active', 'No'),
(322, 'tcollins653@yahoo.com', '', '2020-10-08 04:13:40', '2020-10-08 04:13:40', 'Active', 'No'),
(323, 'manaughfamily@verizon.net', '', '2020-10-08 04:34:26', '2020-10-08 04:34:26', 'Active', 'No'),
(324, 'fkropp56@gmail.com', '', '2020-10-08 04:40:51', '2020-10-08 04:40:51', 'Active', 'No'),
(325, 'graeme.balmain@gmail.com', '', '2020-10-08 16:38:00', '2020-10-08 16:38:00', 'Active', 'No'),
(326, 'cesiliaaguilera@yahoo.com', '', '2020-10-08 17:50:33', '2020-10-08 17:50:33', 'Active', 'No'),
(327, 'nestormanas@cox.net', '', '2020-10-08 21:22:28', '2020-10-08 21:22:28', 'Active', 'No'),
(328, 'precision_plumbing@hotmail.com', '', '2020-10-08 21:23:10', '2020-10-08 21:23:10', 'Active', 'No'),
(329, 'precision_plumbing@hotmail.com', '', '2020-10-08 21:23:12', '2020-10-08 21:23:12', 'Active', 'No'),
(330, 'leslie.aquino.feliz@gmail.com', '', '2020-10-08 21:47:54', '2020-10-08 21:47:54', 'Active', 'No'),
(331, 'doc_norberg10@yahoo.com', '', '2020-10-08 22:27:32', '2020-10-08 22:27:32', 'Active', 'No'),
(332, 'c.m.bishop@hotmail.co.uk', '', '2020-10-08 22:44:47', '2020-10-08 22:44:47', 'Active', 'No'),
(333, 'wildcolboy@gmail.com', '', '2020-10-08 23:00:08', '2020-10-08 23:00:08', 'Active', 'No'),
(334, 'Kaiosborne@gmail.com', '', '2020-10-09 00:58:04', '2020-10-09 00:58:04', 'Active', 'No'),
(335, 'raycovert@yahoo.com', '', '2020-10-09 01:23:19', '2020-10-09 01:23:19', 'Active', 'No'),
(336, 'info@unitedonemtg.com', '', '2020-10-09 02:11:27', '2020-10-09 02:11:27', 'Active', 'No'),
(337, 'KRISHNA.SAI696@GMAIL.COM', '', '2020-10-09 02:35:23', '2020-10-09 02:35:23', 'Active', 'No'),
(338, 'tsolis@comcast.net', '', '2020-10-09 02:55:22', '2020-10-09 02:55:22', 'Active', 'No'),
(339, 'leeliz1110@comcast.net', '', '2020-10-09 03:08:06', '2020-10-09 03:08:06', 'Active', 'No'),
(340, 'piotrkowa@gmail.com', '', '2020-10-09 04:05:10', '2020-10-09 04:05:10', 'Active', 'No'),
(341, 'vlad.maistrenko@outlook.com', '', '2020-10-09 04:05:54', '2020-10-09 04:05:54', 'Active', 'No'),
(342, 'smilekeeperdental@gmail.com', '', '2020-10-09 11:47:51', '2020-10-09 11:47:51', 'Active', 'No'),
(343, 'Wmmalett@aol.com', '', '2020-10-09 12:20:11', '2020-10-09 12:20:11', 'Active', 'No'),
(344, 'dmcfence@gmail.com', '', '2020-10-09 17:10:40', '2020-10-09 17:10:40', 'Active', 'No'),
(345, 'mordy913@yahoo.com', '', '2020-10-09 19:12:12', '2020-10-09 19:12:12', 'Active', 'No'),
(346, 'clpage@tds.net', '', '2020-10-09 21:23:20', '2020-10-09 21:23:20', 'Active', 'No'),
(347, 'bnewman4019@gmail.com', '', '2020-10-09 23:17:04', '2020-10-09 23:17:04', 'Active', 'No'),
(348, 'bnewman4019@gmail.com', '', '2020-10-09 23:17:07', '2020-10-09 23:17:07', 'Active', 'No'),
(349, 'lisaweldon@sbcglobal.net', '', '2020-10-10 04:50:49', '2020-10-10 04:50:49', 'Active', 'No'),
(350, 'erik365@gmail.com', '', '2020-10-10 07:32:50', '2020-10-10 07:32:50', 'Active', 'No'),
(351, 'erik365@gmail.com', '', '2020-10-10 07:32:54', '2020-10-10 07:32:54', 'Active', 'No'),
(352, 'brndnbshm@gmail.com', '', '2020-10-10 09:42:09', '2020-10-10 09:42:09', 'Active', 'No'),
(353, 'maufamovo5868@yahoo.com', '', '2020-10-10 11:33:33', '2020-10-10 11:33:33', 'Active', 'No'),
(354, 'maufamovo5868@yahoo.com', '', '2020-10-10 11:33:34', '2020-10-10 11:33:34', 'Active', 'No'),
(355, 'wolfvetalen6912@yahoo.com', '', '2020-10-10 16:43:48', '2020-10-10 16:43:48', 'Active', 'No'),
(356, 'wolfvetalen6912@yahoo.com', '', '2020-10-10 16:43:52', '2020-10-10 16:43:52', 'Active', 'No'),
(357, 'mordy913@gmail.com', '', '2020-10-10 19:28:31', '2020-10-10 19:28:31', 'Active', 'No'),
(358, 'lopezjanie99@gmail.com', '', '2020-10-10 20:05:39', '2020-10-10 20:05:39', 'Active', 'No'),
(359, 'lopezjanie99@gmail.com', '', '2020-10-10 20:05:44', '2020-10-10 20:05:44', 'Active', 'No'),
(360, 'flamingsword57@gmail.com', '', '2020-10-11 07:06:19', '2020-10-11 07:06:19', 'Active', 'No'),
(361, 'johnslivjak@gmail.com', '', '2020-10-11 14:18:10', '2020-10-11 14:18:10', 'Active', 'No'),
(362, 'clarradialo6599@yahoo.com', '', '2020-10-11 16:44:52', '2020-10-11 16:44:52', 'Active', 'No'),
(363, 'clarradialo6599@yahoo.com', '', '2020-10-11 16:44:56', '2020-10-11 16:44:56', 'Active', 'No'),
(364, 'mordy913@yahoo.com', '', '2020-10-11 18:37:26', '2020-10-11 18:37:26', 'Active', 'No'),
(365, 'mordy913@gmail.com', '', '2020-10-11 19:07:49', '2020-10-11 19:07:49', 'Active', 'No'),
(366, 'bmordhorst@msn.com', '', '2020-10-11 20:07:16', '2020-10-11 20:07:16', 'Active', 'No'),
(367, 'epondu03@hotmail.com', '', '2020-10-11 23:37:51', '2020-10-11 23:37:51', 'Active', 'No'),
(368, 'miguel.loera70@gmail.com', '', '2020-10-12 11:15:46', '2020-10-12 11:15:46', 'Active', 'No'),
(369, 'wojdal@hotmail.com', '', '2020-10-12 13:40:41', '2020-10-12 13:40:41', 'Active', 'No'),
(370, 'ivanportal@hotmail.com', '', '2020-10-12 17:23:55', '2020-10-12 17:23:55', 'Active', 'No'),
(371, 'jacey_mclaughlin31@hotmail.com', '', '2020-10-12 23:35:41', '2020-10-12 23:35:41', 'Active', 'No'),
(372, 'mary@borgesco.com', '', '2020-10-13 00:59:08', '2020-10-13 00:59:08', 'Active', 'No'),
(373, 'bettysess@mail2me.com', '', '2020-10-13 02:34:26', '2020-10-13 02:34:26', 'Active', 'No'),
(374, 'bettysess@mail2me.com', '', '2020-10-13 02:34:29', '2020-10-13 02:34:29', 'Active', 'No'),
(375, 'ormakellqt@gmail.com', '', '2020-10-13 04:00:47', '2020-10-13 04:00:47', 'Active', 'No'),
(376, 'ormakellqt@gmail.com', '', '2020-10-13 04:00:50', '2020-10-13 04:00:50', 'Active', 'No'),
(377, 'jetsautorepair@outlook.com', '', '2020-10-13 04:18:58', '2020-10-13 04:18:58', 'Active', 'No'),
(378, 'jetsautorepair@outlook.com', '', '2020-10-13 04:19:00', '2020-10-13 04:19:00', 'Active', 'No'),
(379, 'john@theburwells.com', '', '2020-10-13 14:18:20', '2020-10-13 14:18:20', 'Active', 'No'),
(380, 'danzelles@gmail.com', '', '2020-10-13 17:07:45', '2020-10-13 17:07:45', 'Active', 'No'),
(381, 'falz0324@aol.com', '', '2020-10-13 19:53:58', '2020-10-13 19:53:58', 'Active', 'No'),
(382, 'rhirsc1041@aol.com', '', '2020-10-13 20:29:14', '2020-10-13 20:29:14', 'Active', 'No'),
(383, 'bigmarty1970@gmail.com', '', '2020-10-13 21:53:08', '2020-10-13 21:53:08', 'Active', 'No'),
(384, 'carolerickson@cox.net', '', '2020-10-14 01:01:21', '2020-10-14 01:01:21', 'Active', 'No'),
(385, 'Oski_19@live.com', '', '2020-10-14 01:43:19', '2020-10-14 01:43:19', 'Active', 'No'),
(386, 'dufresne.etienne@gmail.com', '', '2020-10-14 03:22:08', '2020-10-14 03:22:08', 'Active', 'No'),
(387, 'mls528@hotmail.com', '', '2020-10-14 03:23:08', '2020-10-14 03:23:08', 'Active', 'No'),
(388, 'KATHIELCARPENTER@YAHOO.COM', '', '2020-10-14 04:50:10', '2020-10-14 04:50:10', 'Active', 'No'),
(389, 'limasstacy_76@yahoo.com', '', '2020-10-14 05:54:50', '2020-10-14 05:54:50', 'Active', 'No'),
(390, 'garcia.lidia@gmail.com', '', '2020-10-14 06:04:09', '2020-10-14 06:04:09', 'Active', 'No'),
(391, 'snichols9@nwacc.edu', '', '2020-10-14 06:30:11', '2020-10-14 06:30:11', 'Active', 'No'),
(392, 'IZZYJAS1@YAHOO.COM', '', '2020-10-14 06:44:14', '2020-10-14 06:44:14', 'Active', 'No'),
(393, 'ken@sovereignind.com', '', '2020-10-14 10:48:53', '2020-10-14 10:48:53', 'Active', 'No'),
(394, 'djschnorr@comcast.net', '', '2020-10-14 15:06:11', '2020-10-14 15:06:11', 'Active', 'No'),
(395, 'toonhonig@t-mobilethuis.nl', '', '2020-10-14 17:01:56', '2020-10-14 17:01:56', 'Active', 'No'),
(396, 'rey.marissa127@gmail.com', '', '2020-10-14 20:54:59', '2020-10-14 20:54:59', 'Active', 'No'),
(397, 'Jenny020883@yahoo.com', '', '2020-10-14 21:09:00', '2020-10-14 21:09:00', 'Active', 'No'),
(398, 'i_love_tennis@hotmail.com', '', '2020-10-14 21:58:26', '2020-10-14 21:58:26', 'Active', 'No'),
(399, 'macala4@comcast.net', '', '2020-10-14 22:06:26', '2020-10-14 22:06:26', 'Active', 'No'),
(400, 'parapente@xtra.co.nz', '', '2020-10-14 23:33:25', '2020-10-14 23:33:25', 'Active', 'No'),
(401, 'dande11@swbell.net', '', '2020-10-15 01:30:38', '2020-10-15 01:30:38', 'Active', 'No'),
(402, 'sparrcontracting@comcast.net', '', '2020-10-15 01:43:50', '2020-10-15 01:43:50', 'Active', 'No'),
(403, 'mahar5513@gmail.com', '', '2020-10-15 01:52:28', '2020-10-15 01:52:28', 'Active', 'No'),
(404, 'cbw305@yahoo.com', '', '2020-10-15 07:33:19', '2020-10-15 07:33:19', 'Active', 'No'),
(405, 'maxbasch2@gmail.com', '', '2020-10-15 13:43:05', '2020-10-15 13:43:05', 'Active', 'No'),
(406, 'eric@vonschledorn.com', '', '2020-10-15 14:23:19', '2020-10-15 14:23:19', 'Active', 'No'),
(407, 'pagarelaxmi9@gmail.com', '', '2020-10-15 17:52:06', '2020-10-15 17:52:06', 'Active', 'No'),
(408, 'shercules1221@gmail.com', '', '2020-10-15 18:46:18', '2020-10-15 18:46:18', 'Active', 'No'),
(409, 'denisebruder@comcast.net', '', '2020-10-15 19:34:22', '2020-10-15 19:34:22', 'Active', 'No'),
(410, 'hyy61@hotmail.de', '', '2020-10-15 20:00:57', '2020-10-15 20:00:57', 'Active', 'No'),
(411, 'ne1fuzzy@gmail.com', '', '2020-10-15 21:41:12', '2020-10-15 21:41:12', 'Active', 'No'),
(412, 'wessuccess@bellsouth.net', '', '2020-10-15 23:24:33', '2020-10-15 23:24:33', 'Active', 'No'),
(413, 'arrebafam@yahoo.es', '', '2020-10-15 23:30:46', '2020-10-15 23:30:46', 'Active', 'No'),
(414, 'lockefitzie@hotmail.com', '', '2020-10-16 02:42:49', '2020-10-16 02:42:49', 'Active', 'No'),
(415, 'rleserve@iprimus.com.au', '', '2020-10-16 03:40:54', '2020-10-16 03:40:54', 'Active', 'No'),
(416, '5179364518@tmomail.net', '', '2020-10-16 04:06:32', '2020-10-16 04:06:32', 'Active', 'No'),
(417, 'ljmitchell8586@gmail.com', '', '2020-10-16 06:18:43', '2020-10-16 06:18:43', 'Active', 'No'),
(418, 'staback@adelphia.net', '', '2020-10-16 08:22:24', '2020-10-16 08:22:24', 'Active', 'No'),
(419, 'staback@verizon.net', '', '2020-10-16 08:34:00', '2020-10-16 08:34:00', 'Active', 'No'),
(421, 'alicepadgett@gte.net', '', '2020-10-16 12:42:48', '2020-10-16 12:42:48', 'Active', 'No'),
(422, 'amanda2004mason@gmail.com', '', '2020-10-16 13:20:39', '2020-10-16 13:20:39', 'Active', 'No'),
(423, 'posbitero7425@yahoo.com', '', '2020-10-16 13:54:57', '2020-10-16 13:54:57', 'Active', 'No'),
(424, 'posbitero7425@yahoo.com', '', '2020-10-16 13:55:00', '2020-10-16 13:55:00', 'Active', 'No'),
(425, 'pagarelaxmi1@gmail.com', '', '2020-10-16 15:00:23', '2020-10-16 15:00:23', 'Active', 'No'),
(426, 'marcymarcy28@gmail.com', '', '2020-10-16 18:59:58', '2020-10-16 18:59:58', 'Active', 'No'),
(427, 'ROSEBUDLOVE1993@YAHOO.COM', '', '2020-10-16 19:40:54', '2020-10-16 19:40:54', 'Active', 'No'),
(428, 'Harrietheywood@gmail.com', '', '2020-10-16 20:12:07', '2020-10-16 20:12:07', 'Active', 'No'),
(429, 'jim@povec.com', '', '2020-10-16 20:55:48', '2020-10-16 20:55:48', 'Active', 'No'),
(430, 'alexarzeno1996@hotmail.com', '', '2020-10-16 21:26:16', '2020-10-16 21:26:16', 'Active', 'No'),
(431, 'becky@idalaw.com', '', '2020-10-16 22:24:58', '2020-10-16 22:24:58', 'Active', 'No'),
(432, 'misty02@virginmedia.com', '', '2020-10-16 22:46:19', '2020-10-16 22:46:19', 'Active', 'No'),
(433, 'RGONZALEZ323777@YAHOO.COM', '', '2020-10-16 23:25:39', '2020-10-16 23:25:39', 'Active', 'No'),
(434, 'legacydragon@gmail.com', '', '2020-10-17 01:51:29', '2020-10-17 01:51:29', 'Active', 'No'),
(435, 'Bobanfamily@comcast.net', '', '2020-10-17 02:15:35', '2020-10-17 02:15:35', 'Active', 'No'),
(436, 'jolirogf@bigpond.net.au', '', '2020-10-17 02:28:39', '2020-10-17 02:28:39', 'Active', 'No'),
(437, 'jan.martinez@csueastbay.edu', '', '2020-10-17 06:33:15', '2020-10-17 06:33:15', 'Active', 'No'),
(438, 'VINCE@BHGRELA.COM', '', '2020-10-17 08:31:09', '2020-10-17 08:31:09', 'Active', 'No'),
(442, 'linda.reino@comcast.net', '', '2020-10-17 21:49:19', '2020-10-17 21:49:19', 'Active', 'No'),
(443, 'mollyandmax2@cs.com', '', '2020-10-18 03:36:12', '2020-10-18 03:36:12', 'Active', 'No'),
(444, 'MIKER@REINOS.NET', '', '2020-10-18 21:20:01', '2020-10-18 21:20:01', 'Active', 'No'),
(445, 'esther_ch01@yahoo.es', '', '2020-10-19 00:03:59', '2020-10-19 00:03:59', 'Active', 'No'),
(446, 'solsepi2@gmail.com', '', '2020-10-19 04:33:33', '2020-10-19 04:33:33', 'Active', 'No'),
(447, 'ndarchie@bellsouth.net', '', '2020-10-19 05:43:24', '2020-10-19 05:43:24', 'Active', 'No'),
(448, 'goodgirl16354@yahoo.com', '', '2020-10-19 15:03:53', '2020-10-19 15:03:53', 'Active', 'No'),
(449, 'hldrake@hotmail.co.uk', '', '2020-10-19 15:11:30', '2020-10-19 15:11:30', 'Active', 'No'),
(450, 'leighton_speer@live.com', '', '2020-10-19 17:14:03', '2020-10-19 17:14:03', 'Active', 'No'),
(451, 'robchesla@yahoo.com', '', '2020-10-19 17:52:38', '2020-10-19 17:52:38', 'Active', 'No'),
(452, 'alexzandra.t@hotmail.com', '', '2020-10-19 18:39:26', '2020-10-19 18:39:26', 'Active', 'No'),
(453, 'JOHN@JMPBENTERPRISES.COM', '', '2020-10-19 19:02:54', '2020-10-19 19:02:54', 'Active', 'No'),
(454, 'zien318@hotmail.com', '', '2020-10-19 22:33:39', '2020-10-19 22:33:39', 'Active', 'No'),
(455, 'CATHY.DALPRA@GMAIL.COM', '', '2020-10-20 01:00:15', '2020-10-20 01:00:15', 'Active', 'No'),
(456, 'steberle1@hotmail.com', '', '2020-10-20 01:22:47', '2020-10-20 01:22:47', 'Active', 'No'),
(457, 'prostreet868@yahoo.com', '', '2020-10-20 03:08:09', '2020-10-20 03:08:09', 'Active', 'No'),
(458, 'NAIRZA@HOTMAIL.COM', '', '2020-10-20 03:09:11', '2020-10-20 03:09:11', 'Active', 'No'),
(459, 'bencam@aol.com', '', '2020-10-20 03:52:00', '2020-10-20 03:52:00', 'Active', 'No'),
(460, 'strep123@aol.com', '', '2020-10-20 06:29:37', '2020-10-20 06:29:37', 'Active', 'No'),
(461, 'prostreet868@yahoo.com', '', '2020-10-20 16:25:49', '2020-10-20 16:25:49', 'Active', 'No'),
(462, 'skielgass@gmail.com', '', '2020-10-20 18:22:01', '2020-10-20 18:22:01', 'Active', 'No'),
(463, 'jared8212@yahoo.com', '', '2020-10-20 20:10:08', '2020-10-20 20:10:08', 'Active', 'No'),
(464, 'umadbro8910@hotmail.com', '', '2020-10-20 21:37:57', '2020-10-20 21:37:57', 'Active', 'No'),
(465, 'rich@grace-efca.org', '', '2020-10-20 23:07:01', '2020-10-20 23:07:01', 'Active', 'No'),
(466, 'rosergodo@gmail.com', '', '2020-10-20 23:43:47', '2020-10-20 23:43:47', 'Active', 'No'),
(467, 'sales@lounge-tek.com', '', '2020-10-21 00:57:07', '2020-10-21 00:57:07', 'Active', 'No'),
(468, 'kitkat8981@yahoo.com', '', '2020-10-21 01:31:16', '2020-10-21 01:31:16', 'Active', 'No'),
(469, 'jornetana@gmail.com', '', '2020-10-21 02:08:13', '2020-10-21 02:08:13', 'Active', 'No'),
(470, 'CATHY.DALPRA@GMAIL.COM', '', '2020-10-21 02:38:41', '2020-10-21 02:38:41', 'Active', 'No'),
(471, 'eac@myactv.net', '', '2020-10-21 03:40:53', '2020-10-21 03:40:53', 'Active', 'No'),
(472, 'zerocrs@gmail.com', '', '2020-10-21 07:04:31', '2020-10-21 07:04:31', 'Active', 'No'),
(473, 'ddrice1979@yahoo.com', '', '2020-10-21 12:29:14', '2020-10-21 12:29:14', 'Active', 'No'),
(474, 'mcghee.asia1@gmail.com', '', '2020-10-21 16:36:21', '2020-10-21 16:36:21', 'Active', 'No'),
(475, 'nisumleslo4222@yahoo.com', '', '2020-10-21 17:50:19', '2020-10-21 17:50:19', 'Active', 'No'),
(476, 'nisumleslo4222@yahoo.com', '', '2020-10-21 17:50:21', '2020-10-21 17:50:21', 'Active', 'No'),
(477, 'TCOLL813@GMAIL.COM', '', '2020-10-21 19:33:12', '2020-10-21 19:33:12', 'Active', 'No'),
(478, 'sandyw@wi.rr.com', '', '2020-10-21 22:42:16', '2020-10-21 22:42:16', 'Active', 'No'),
(479, 'lisette.g24@hotmail.com', '', '2020-10-21 22:46:39', '2020-10-21 22:46:39', 'Active', 'No'),
(480, 'oldaker.1@OSU.EDU', '', '2020-10-22 00:11:07', '2020-10-22 00:11:07', 'Active', 'No'),
(481, 'denisebruder@comcast.net', '', '2020-10-22 00:35:56', '2020-10-22 00:35:56', 'Active', 'No'),
(482, 'yutang@ucsd.edu', '', '2020-10-22 02:42:44', '2020-10-22 02:42:44', 'Active', 'No'),
(483, 'tetroa@gmail.com', '', '2020-10-22 04:19:42', '2020-10-22 04:19:42', 'Active', 'No'),
(484, 'tetroa@gmail.com', '', '2020-10-22 05:13:53', '2020-10-22 05:13:53', 'Active', 'No'),
(485, 'andreya@vidavida.co.uk', '', '2020-10-22 05:43:01', '2020-10-22 05:43:01', 'Active', 'No'),
(486, 'charmtucker22@gmail.com', '', '2020-10-22 19:59:08', '2020-10-22 19:59:08', 'Active', 'No'),
(487, 'charmainethomas589@gmail.com', '', '2020-10-22 20:45:20', '2020-10-22 20:45:20', 'Active', 'No'),
(488, 'anita-john@comcast.net', '', '2020-10-22 20:49:28', '2020-10-22 20:49:28', 'Active', 'No'),
(489, 'carlos@pimmexcontracting.com', '', '2020-10-22 21:27:24', '2020-10-22 21:27:24', 'Active', 'No'),
(490, 'rnmelodyfox@gmail.com', '', '2020-10-22 21:39:23', '2020-10-22 21:39:23', 'Active', 'No'),
(491, 'katiekane1103@yahoo.com', '', '2020-10-22 21:56:17', '2020-10-22 21:56:17', 'Active', 'No'),
(492, 'misstretro@gmail.com', '', '2020-10-22 22:58:52', '2020-10-22 22:58:52', 'Active', 'No'),
(493, 'petrinawhite1@gmail.com', '', '2020-10-22 23:02:39', '2020-10-22 23:02:39', 'Active', 'No'),
(494, 'MICHAELCARRILLO57@GMAIL.COM', '', '2020-10-23 03:17:20', '2020-10-23 03:17:20', 'Active', 'No'),
(495, 'lynach1@yahoo.com', '', '2020-10-23 03:46:58', '2020-10-23 03:46:58', 'Active', 'No'),
(496, 'aboodogedqk@gmail.com', '', '2020-10-23 04:08:40', '2020-10-23 04:08:40', 'Active', 'No'),
(497, 'aboodogedqk@gmail.com', '', '2020-10-23 04:08:43', '2020-10-23 04:08:43', 'Active', 'No'),
(498, 'jump4Him@comcast.net', '', '2020-10-23 04:42:15', '2020-10-23 04:42:15', 'Active', 'No'),
(499, 'hillismr@gmail.com', '', '2020-10-23 05:08:23', '2020-10-23 05:08:23', 'Active', 'No'),
(500, 'saraivallereta00@gmail.com', '', '2020-10-23 05:42:05', '2020-10-23 05:42:05', 'Active', 'No'),
(501, 'marym@enrgm.com', '', '2020-10-23 06:07:53', '2020-10-23 06:07:53', 'Active', 'No'),
(502, 'ryancrookston@hotmail.co.uk', '', '2020-10-23 18:45:39', '2020-10-23 18:45:39', 'Active', 'No'),
(503, 'adotson68@yahoo.com', '', '2020-10-23 19:15:06', '2020-10-23 19:15:06', 'Active', 'No'),
(504, 'WERNERDARE@HOTMAIL.COM', '', '2020-10-23 20:49:30', '2020-10-23 20:49:30', 'Active', 'No'),
(505, 'smarj123@gmail.com', '', '2020-10-23 22:30:21', '2020-10-23 22:30:21', 'Active', 'No'),
(506, 'ravi_82_k@yahoo.co.in', '', '2020-10-24 00:37:10', '2020-10-24 00:37:10', 'Active', 'No'),
(507, 'marey1967@hotmail.com', '', '2020-10-24 03:23:43', '2020-10-24 03:23:43', 'Active', 'No'),
(508, 'merunumdown@yahoo.com', '', '2020-10-24 03:27:47', '2020-10-24 03:27:47', 'Active', 'No'),
(509, 'cvancan2@aol.com', '', '2020-10-24 03:49:48', '2020-10-24 03:49:48', 'Active', 'No'),
(510, 'joycenemetz@gmail.com', '', '2020-10-24 04:09:45', '2020-10-24 04:09:45', 'Active', 'No'),
(511, 'kmkschafer@aol.com', '', '2020-10-24 12:24:47', '2020-10-24 12:24:47', 'Active', 'No'),
(512, 'dkpackman@gmail.com', '', '2020-10-24 16:32:33', '2020-10-24 16:32:33', 'Active', 'No'),
(513, 'developer@techrupt.in', '', '2020-10-24 16:38:25', '2020-10-24 16:38:25', 'Active', 'No'),
(515, 'raj.marathe19@gmail.com', '', '2020-10-24 17:08:37', '2020-11-20 11:56:39', 'Active', 'Yes'),
(516, 'ssanthebennur@gmail.com', '', '2020-10-24 20:44:34', '2020-10-24 20:44:34', 'Active', 'No'),
(517, 'melttracy@yahoo.com', '', '2020-10-24 23:17:14', '2020-10-24 23:17:14', 'Active', 'No'),
(518, 'p.pradeep528@gmail.com', '', '2020-10-25 01:44:50', '2020-10-25 01:44:50', 'Active', 'No'),
(519, 'zoe.julia@hotmail.co.uk', '', '2020-10-25 03:16:40', '2020-10-25 03:16:40', 'Active', 'No'),
(520, 'cmsteffens@optonline.net', '', '2020-10-25 10:28:24', '2020-10-25 10:28:24', 'Active', 'No'),
(521, 'kimberly.kolbeck@yahoo.com', '', '2020-10-25 19:07:34', '2020-10-25 19:07:34', 'Active', 'No'),
(522, 'patriciobernabeu@gmail.com', '', '2020-10-25 19:10:33', '2020-10-25 19:10:33', 'Active', 'No'),
(523, 'kmkschafer@aol.com', '', '2020-10-25 19:49:44', '2020-10-25 19:49:44', 'Active', 'No'),
(524, 'th.flach@t-online.de', '', '2020-10-26 01:49:10', '2020-10-26 01:49:10', 'Active', 'No'),
(525, 'fut_ngal_c.traian@yahoo.com', '', '2020-10-26 06:12:26', '2020-10-26 06:12:26', 'Active', 'No'),
(526, 'sarah@seisei.com', '', '2020-10-26 09:48:01', '2020-10-26 09:48:01', 'Active', 'No'),
(527, 'KIRKDRIGGERS@AOL.COM', '', '2020-10-26 14:51:44', '2020-10-26 14:51:44', 'Active', 'No'),
(528, 'christopher@waitefuneralhome.com', '', '2020-10-26 15:56:39', '2020-10-26 15:56:39', 'Active', 'No'),
(529, 'macaulay45@hotmail.co.uk', '', '2020-10-26 19:13:07', '2020-10-26 19:13:07', 'Active', 'No'),
(530, 'scott.hadley@live.co.uk', '', '2020-10-26 19:49:37', '2020-10-26 19:49:37', 'Active', 'No'),
(531, 'ssanthebennur@gmail.com', '', '2020-10-26 19:50:46', '2020-10-26 19:50:46', 'Active', 'No'),
(532, 'Subarustiguykm1@gmail.com', '', '2020-10-27 01:04:55', '2020-10-27 01:04:55', 'Active', 'No'),
(533, 'stephbradbury2@hotmail.com', '', '2020-10-27 01:49:09', '2020-10-27 01:49:09', 'Active', 'No'),
(534, 'KIRKDRIGGERS@AOL.COM', '', '2020-10-27 02:35:08', '2020-10-27 02:35:08', 'Active', 'No'),
(535, 'sheafoo4@yahoo.com', '', '2020-10-27 03:19:17', '2020-10-27 03:19:17', 'Active', 'No'),
(536, 'harrison.wright@hotmail.com.au', '', '2020-10-27 03:38:08', '2020-10-27 03:38:08', 'Active', 'No'),
(537, 'christopher@waitefuneralhome.com', '', '2020-10-27 03:44:25', '2020-10-27 03:44:25', 'Active', 'No'),
(538, 'twchambers54@gmail.com', '', '2020-10-27 05:02:40', '2020-10-27 05:02:40', 'Active', 'No'),
(539, 'christopher@waitefuneralhome.com', '', '2020-10-27 05:49:48', '2020-10-27 05:49:48', 'Active', 'No');
INSERT INTO `subscription` (`id`, `email`, `name`, `created_at`, `updated_at`, `status`, `is_deleted`) VALUES
(540, 'KIRKDRIGGERS@AOL.COM', '', '2020-10-27 07:35:29', '2020-10-27 07:35:29', 'Active', 'No'),
(541, 'rlw.contracting.nz@gmail.com', '', '2020-10-27 09:21:59', '2020-10-27 09:21:59', 'Active', 'No'),
(542, 'KIRKDRIGGERS@AOL.COM', '', '2020-10-27 09:53:59', '2020-10-27 09:53:59', 'Active', 'No'),
(543, 'LENNY.CUSUMANO@HUDSONFG.COM', '', '2020-10-27 11:28:47', '2020-10-27 11:28:47', 'Active', 'No'),
(544, 'drshivakumargowda80@gmail.com', '', '2020-10-27 11:47:42', '2020-10-27 11:47:42', 'Active', 'No'),
(545, 'susann.mell@yahoo.com', '', '2020-10-27 12:09:53', '2020-10-27 12:09:53', 'Active', 'No'),
(546, 'susann.mell@yahoo.com', '', '2020-10-27 12:10:07', '2020-10-27 12:10:07', 'Active', 'No'),
(547, 'twchambers54@gmail.com', '', '2020-10-27 12:26:58', '2020-10-27 12:26:58', 'Active', 'No'),
(548, 'christopher@waitefuneralhome.com', '', '2020-10-27 14:36:20', '2020-10-27 14:36:20', 'Active', 'No'),
(549, 'zigi.zhu@gmail.com', '', '2020-10-27 16:49:55', '2020-10-27 16:49:55', 'Active', 'No'),
(550, 'caita94@hotmail.com', '', '2020-10-27 17:32:55', '2020-10-27 17:32:55', 'Active', 'No'),
(551, 'coralee_whitmire@yahoo.com', '', '2020-10-27 20:23:34', '2020-10-27 20:23:34', 'Active', 'No'),
(552, 'coralee_whitmire@yahoo.com', '', '2020-10-27 20:23:38', '2020-10-27 20:23:38', 'Active', 'No'),
(553, 'woody@woodylove.com', '', '2020-10-27 21:24:06', '2020-10-27 21:24:06', 'Active', 'No'),
(554, 'asfraccica@roadrunner.com', '', '2020-10-27 23:47:42', '2020-10-27 23:47:42', 'Active', 'No'),
(555, 'jgcummins@brigidine.nsw.edu.au', '', '2020-10-28 00:38:25', '2020-10-28 00:38:25', 'Active', 'No'),
(556, 'ximenasolism@gmail.com', '', '2020-10-28 12:07:59', '2020-10-28 12:07:59', 'Active', 'No'),
(557, 'navogen845@gmail.com', '', '2020-10-28 12:26:41', '2020-10-28 12:26:41', 'Active', 'No'),
(558, 'navogen845@gmail.com', '', '2020-10-28 12:26:43', '2020-10-28 12:26:43', 'Active', 'No'),
(559, 'meghan.staveley@yahoo.com', '', '2020-10-28 14:53:23', '2020-10-28 14:53:23', 'Active', 'No'),
(560, 'meghan.staveley@yahoo.com', '', '2020-10-28 14:53:25', '2020-10-28 14:53:25', 'Active', 'No'),
(561, 'aeobrien2@gmail.com', '', '2020-10-28 15:59:58', '2020-10-28 15:59:58', 'Active', 'No'),
(562, 'kenco00@hotmail.com', '', '2020-10-28 17:35:02', '2020-10-28 17:35:02', 'Active', 'No'),
(563, 'tamra6220@msn.com', '', '2020-10-28 20:40:29', '2020-10-28 20:40:29', 'Active', 'No'),
(564, 'insightpropertygroup@gmail.com', '', '2020-10-28 21:16:31', '2020-10-28 21:16:31', 'Active', 'No'),
(565, 'bley.hack@gmail.com', '', '2020-10-28 21:39:50', '2020-10-28 21:39:50', 'Active', 'No'),
(566, 'natalie.lording@bigpond.com', '', '2020-10-29 03:24:21', '2020-10-29 03:24:21', 'Active', 'No'),
(567, 'gzummo@cs.com', '', '2020-10-29 04:06:43', '2020-10-29 04:06:43', 'Active', 'No'),
(568, 'icca500@bellsouth.net', '', '2020-10-29 06:17:01', '2020-10-29 06:17:01', 'Active', 'No'),
(569, 'olgagtc@gmail.com', '', '2020-10-29 13:43:22', '2020-10-29 13:43:22', 'Active', 'No'),
(570, 'daleephillips@msn.com', '', '2020-10-29 15:16:50', '2020-10-29 15:16:50', 'Active', 'No'),
(572, 'Garciarosemary03@yahoo.com', '', '2020-10-29 21:32:28', '2020-10-29 21:32:28', 'Active', 'No'),
(573, 'bashatfq1995@gmail.com', '', '2020-10-29 22:56:29', '2020-10-29 22:56:29', 'Active', 'No'),
(574, 'ssanthebennur@gmail.com', '', '2020-10-30 00:53:20', '2020-10-30 00:53:20', 'Active', 'No'),
(575, 'pagarelaxmi@gmail.com', 'Laxmi Pagare', '2020-10-30 10:56:24', '2020-10-30 10:56:24', 'Active', 'No'),
(576, 'adriennern45@gmail.com', '', '2020-10-30 12:01:10', '2020-10-30 12:01:10', 'Active', 'No'),
(577, 'drsonalwrajami@gmail.com', '', '2020-10-30 16:40:43', '2020-10-30 16:40:43', 'Active', 'No'),
(578, 'calin.septimiu28@gmail.com', '', '2020-10-30 19:00:34', '2020-10-30 19:00:34', 'Active', 'No'),
(579, 'ekohlhausen@hotmail.com', '', '2020-10-30 21:40:08', '2020-10-30 21:40:08', 'Active', 'No'),
(580, 'atwining@live.com.au', '', '2020-10-30 22:46:04', '2020-10-30 22:46:04', 'Active', 'No'),
(581, 'vaishnavi.kandala5@gmail.com', '', '2020-10-30 23:03:28', '2020-10-30 23:03:28', 'Active', 'No'),
(582, 'ctierney14@gmail.com', '', '2020-10-30 23:14:10', '2020-10-30 23:14:10', 'Active', 'No'),
(583, 'mte4x4@aol.com', '', '2020-10-31 03:07:23', '2020-10-31 03:07:23', 'Active', 'No'),
(584, 'bashatfq1995@gmail.com', '', '2020-10-31 05:31:52', '2020-10-31 05:31:52', 'Active', 'No'),
(585, 'surendrajnvu@gmail.com', 'Surendra singh', '2020-10-31 17:03:45', '2020-10-31 17:03:45', 'Active', 'No'),
(586, 'schnellnina@msn.com', '', '2020-10-31 23:45:27', '2020-10-31 23:45:27', 'Active', 'No'),
(587, 'spallasena@memcorporation.com', '', '2020-11-02 10:18:14', '2020-11-02 10:18:14', 'Active', 'No'),
(588, 'spallasena@memcorporation.com', '', '2020-11-02 10:37:51', '2020-11-02 10:37:51', 'Active', 'No'),
(589, 'vale96ventu@hotmail.it', '', '2020-11-02 11:15:11', '2020-11-02 11:15:11', 'Active', 'No'),
(590, 'zuggy84@gmail.com', '', '2020-11-02 14:57:45', '2020-11-02 14:57:45', 'Active', 'No'),
(591, 'webdesigner@techrupt.in', 'Surendra', '2020-11-02 16:46:36', '2020-11-02 16:46:36', 'Active', 'No'),
(592, 'ji3ird@gmail.com', '', '2020-11-02 18:42:55', '2020-11-02 18:42:55', 'Active', 'No'),
(593, 'newshammaximina@yahoo.com', '', '2020-11-02 19:17:47', '2020-11-02 19:17:47', 'Active', 'No'),
(594, 'newshammaximina@yahoo.com', '', '2020-11-02 19:17:49', '2020-11-02 19:17:49', 'Active', 'No'),
(595, 'lailing620@gmail.com', '', '2020-11-02 22:40:55', '2020-11-02 22:40:55', 'Active', 'No'),
(596, 'karlbarreto@outlook.com', '', '2020-11-03 00:49:11', '2020-11-03 00:49:11', 'Active', 'No'),
(597, 'moultrie.annette@gmail.com', '', '2020-11-03 02:00:05', '2020-11-03 02:00:05', 'Active', 'No'),
(598, 'ashin7900@yahoo.com', '', '2020-11-03 03:08:47', '2020-11-03 03:08:47', 'Active', 'No'),
(599, 'rozziefoxx@ymail.com', '', '2020-11-03 03:15:50', '2020-11-03 03:15:50', 'Active', 'No'),
(600, 'yasrulez@hotmail.com', '', '2020-11-03 04:54:26', '2020-11-03 04:54:26', 'Active', 'No'),
(601, 'tony19@cox.net', '', '2020-11-03 05:15:32', '2020-11-03 05:15:32', 'Active', 'No'),
(602, 'julieve@att.net', '', '2020-11-03 09:11:55', '2020-11-03 09:11:55', 'Active', 'No'),
(603, 'willowby45@hotmail.com', '', '2020-11-03 21:27:10', '2020-11-03 21:27:10', 'Active', 'No'),
(604, 'gbaber.gb@gmail.com', '', '2020-11-04 01:59:35', '2020-11-04 01:59:35', 'Active', 'No'),
(605, 'marguerite.lesieur@us.af.mil', '', '2020-11-04 02:34:43', '2020-11-04 02:34:43', 'Active', 'No'),
(606, 'countrymommi@aol.com', '', '2020-11-04 06:45:51', '2020-11-04 06:45:51', 'Active', 'No'),
(607, 'juwairiyyahfatima@gmail.com', '', '2020-11-04 22:14:40', '2020-11-04 22:14:40', 'Active', 'No'),
(608, 'murlimanghanii@gmail.com', '', '2020-11-04 22:57:41', '2020-11-04 22:57:41', 'Active', 'No'),
(609, 'shikhaganjawala00@gmail.com', '', '2020-11-04 23:18:50', '2020-11-04 23:18:50', 'Active', 'No'),
(610, 'dlgray51@aol.com', '', '2020-11-04 23:27:19', '2020-11-04 23:27:19', 'Active', 'No'),
(611, 'a.serafin@mail.com', '', '2020-11-05 00:52:56', '2020-11-05 00:52:56', 'Active', 'No'),
(612, 'josleroux@shaw.ca', '', '2020-11-05 01:01:10', '2020-11-05 01:01:10', 'Active', 'No'),
(613, 'travellingtaui@yahoo.ca', '', '2020-11-05 01:22:33', '2020-11-05 01:22:33', 'Active', 'No'),
(614, 'GATORZMOM@HOTMAIL.COM', '', '2020-11-05 02:36:31', '2020-11-05 02:36:31', 'Active', 'No'),
(615, 'karlbarreto@outlook.com', '', '2020-11-05 05:31:11', '2020-11-05 05:31:11', 'Active', 'No'),
(616, 'shawnie9361@yahoo.com', '', '2020-11-05 06:03:12', '2020-11-05 06:03:12', 'Active', 'No'),
(617, 'girinadh072@gmail.com', '', '2020-11-05 06:40:03', '2020-11-05 06:40:03', 'Active', 'No'),
(618, 'TROY@GLENDALEFIRESYSTEMS.COM', '', '2020-11-05 07:19:03', '2020-11-05 07:19:03', 'Active', 'No'),
(619, 'Tyw@gerberengineering.com', '', '2020-11-05 07:30:10', '2020-11-05 07:30:10', 'Active', 'No'),
(620, 'halvadesposito@gmail.com', '', '2020-11-05 12:40:41', '2020-11-05 12:40:41', 'Active', 'No'),
(621, 'ferguson0303@gmail.com', '', '2020-11-05 15:06:17', '2020-11-05 15:06:17', 'Active', 'No'),
(622, 'TROY@GLENDALEFIRESYSTEMS.COM', '', '2020-11-05 15:18:43', '2020-11-05 15:18:43', 'Active', 'No'),
(623, 'hazelnut33483@yahoo.com', '', '2020-11-05 17:46:20', '2020-11-05 17:46:20', 'Active', 'No'),
(624, 'hgonzalez0517@gmail.com', '', '2020-11-05 18:03:19', '2020-11-05 18:03:19', 'Active', 'No'),
(625, 'Berrytayon88@gmail.com', '', '2020-11-05 18:19:31', '2020-11-05 18:19:31', 'Active', 'No'),
(626, 'MarthaBrw94@gmail.com', '', '2020-11-05 20:10:42', '2020-11-05 20:10:42', 'Active', 'No'),
(627, 'latrice.lewis@ymail.com', '', '2020-11-05 23:48:55', '2020-11-05 23:48:55', 'Active', 'No'),
(628, 'halvadesposito@gmail.com', '', '2020-11-06 01:03:12', '2020-11-06 01:03:12', 'Active', 'No'),
(629, 'alexandria.taylor66@gmail.com', '', '2020-11-06 01:37:59', '2020-11-06 01:37:59', 'Active', 'No'),
(630, 'ARICKNER71@GMAIL.COM', '', '2020-11-06 01:44:59', '2020-11-06 01:44:59', 'Active', 'No'),
(631, 'dwakeen62475@yahoo.com', '', '2020-11-06 02:57:37', '2020-11-06 02:57:37', 'Active', 'No'),
(632, 'john.leon@comcast.net', '', '2020-11-06 07:34:03', '2020-11-06 07:34:03', 'Active', 'No'),
(633, 'chloe.eames@gmail.com', '', '2020-11-06 08:25:26', '2020-11-06 08:25:26', 'Active', 'No'),
(634, 'webdeveloper@techrupt.in', 'Laxmi Pagare', '2020-11-06 10:36:46', '2020-11-06 14:51:56', 'Active', 'No'),
(635, 'vitekzy@gmail.com', '', '2020-11-06 11:40:53', '2020-11-06 11:40:53', 'Active', 'No'),
(636, 'seo@techrupt.in', 'Saurabh', '2020-11-06 11:44:46', '2020-11-06 11:44:46', 'Active', 'No'),
(637, 'khirod.kumar89@gmail.com', '', '2020-11-06 14:31:42', '2020-11-06 14:31:42', 'Active', 'No'),
(638, 'dbfitness18@gmail.com', '', '2020-11-06 16:31:05', '2020-11-06 16:31:05', 'Active', 'No'),
(639, 'hegdemanvitha571@gmail.com', '', '2020-11-06 16:33:07', '2020-11-06 16:33:07', 'Active', 'No'),
(640, 'hegdemanvitha571@gmail.com', '', '2020-11-06 16:35:35', '2020-11-06 16:35:35', 'Active', 'No'),
(641, 'zohapathan710@gmail.com', '', '2020-11-06 17:08:33', '2020-11-06 17:08:33', 'Active', 'No'),
(642, 'lona.nielsen.calgary@gmail.com', '', '2020-11-06 21:10:51', '2020-11-06 21:10:51', 'Active', 'No'),
(643, 'chandrakashish@yahoo.com', '', '2020-11-06 21:33:57', '2020-11-06 21:33:57', 'Active', 'No'),
(644, 'kashishchandra321@gmail.com', '', '2020-11-06 21:34:25', '2020-11-06 21:34:25', 'Active', 'No'),
(645, 'rcddjd@earthlink.net', '', '2020-11-06 21:39:40', '2020-11-06 21:39:40', 'Active', 'No'),
(646, 'quadroshannah99@gmail.com', '', '2020-11-06 21:49:31', '2020-11-06 21:49:31', 'Active', 'No'),
(647, 'bozdavis@gmail.com', '', '2020-11-06 21:50:49', '2020-11-06 21:50:49', 'Active', 'No'),
(648, 'buckman@buckmanlegal.com', '', '2020-11-06 22:00:51', '2020-11-06 22:00:51', 'Active', 'No'),
(649, 'girinadh072@gmail.com', '', '2020-11-06 22:45:04', '2020-11-06 22:45:04', 'Active', 'No'),
(650, 'trachytefunctional2479@gmail.com', '', '2020-11-07 00:04:35', '2020-11-07 00:04:35', 'Active', 'No'),
(651, 'premraje9047@gmail.com', '', '2020-11-07 00:43:15', '2020-11-07 00:43:15', 'Active', 'No'),
(652, 'liv_d_lyf@yahoo.co.in', '', '2020-11-07 02:44:04', '2020-11-07 02:44:04', 'Active', 'No'),
(653, 'snehaambardekar@gmail.com', '', '2020-11-07 12:24:59', '2020-11-07 12:24:59', 'Active', 'No'),
(654, 'mayuri.sahas19@gmail.com', '', '2020-11-07 13:31:54', '2020-11-07 13:31:54', 'Active', 'No'),
(655, 'rk4242P@gmail.com', '', '2020-11-07 14:51:02', '2020-11-07 14:51:02', 'Active', 'No'),
(656, 'bertrand.wolf@acs-andelfinger.fr', '', '2020-11-07 14:54:13', '2020-11-07 14:54:13', 'Active', 'No'),
(657, 'madhurya1496@gmail.com', '', '2020-11-07 15:59:51', '2020-11-07 15:59:51', 'Active', 'No'),
(658, 'leesa8592@gmail.com', '', '2020-11-07 21:27:27', '2020-11-07 21:27:27', 'Active', 'No'),
(659, 'patidargolu09@gmail.com', '', '2020-11-08 08:40:16', '2020-11-08 08:40:16', 'Active', 'No'),
(660, 'tpickles52@gmail.com', '', '2020-11-08 09:57:31', '2020-11-08 09:57:31', 'Active', 'No'),
(661, 'salamander28_2003@hotmail.com', '', '2020-11-08 13:41:23', '2020-11-08 13:41:23', 'Active', 'No'),
(662, 'shake_that_booty_4_u@hotmail.com', '', '2020-11-08 18:39:39', '2020-11-08 18:39:39', 'Active', 'No'),
(663, 'jacob.t98@hotmail.com', '', '2020-11-09 05:41:09', '2020-11-09 05:41:09', 'Active', 'No'),
(664, 'nutridock.com@domstat.su', '', '2020-11-09 12:52:49', '2020-11-09 12:52:49', 'Active', 'No'),
(665, 'dan@dankuiper.com', '', '2020-11-09 15:41:18', '2020-11-09 15:41:18', 'Active', 'No'),
(666, 'meganferguson13@yahoo.co.uk', '', '2020-11-09 18:22:30', '2020-11-09 18:22:30', 'Active', 'No'),
(667, 'myp3131@gmail.com', '', '2020-11-09 20:56:33', '2020-11-09 20:56:33', 'Active', 'No'),
(668, 'brumfield76@yahoo.com', '', '2020-11-09 21:30:09', '2020-11-09 21:30:09', 'Active', 'No'),
(669, 'malcolm@mlovettjr.com', '', '2020-11-10 01:29:13', '2020-11-10 01:29:13', 'Active', 'No'),
(670, 'beaversjerika@gmail.com', '', '2020-11-10 02:03:19', '2020-11-10 02:03:19', 'Active', 'No'),
(671, 'igelin1112@gmail.com', '', '2020-11-10 15:37:02', '2020-11-10 15:37:02', 'Active', 'No'),
(672, 'urvashitikmani@yahoo.com', '', '2020-11-10 17:56:56', '2020-11-10 17:56:56', 'Active', 'No'),
(673, 'urvashitikmani1310@gmail.com', '', '2020-11-10 17:57:04', '2020-11-10 17:57:04', 'Active', 'No'),
(674, 'jimmiemc@rocketmail.com', '', '2020-11-10 19:19:41', '2020-11-10 19:19:41', 'Active', 'No'),
(675, 'Crisdeonnac@rocketmail.com', '', '2020-11-10 22:50:02', '2020-11-10 22:50:02', 'Active', 'No'),
(676, 'adrianecarino@hotmail.com', '', '2020-11-10 23:14:12', '2020-11-10 23:14:12', 'Active', 'No'),
(677, 'dmiles252@yahoo.com', '', '2020-11-10 23:48:10', '2020-11-10 23:48:10', 'Active', 'No'),
(678, 'mikedavis974@gmail.com', '', '2020-11-11 00:23:59', '2020-11-11 00:23:59', 'Active', 'No'),
(679, 'dermont.miles@gmail.com', '', '2020-11-11 00:40:38', '2020-11-11 00:40:38', 'Active', 'No'),
(680, 'NICOLEBERG15@GMAIL.COM', '', '2020-11-11 01:00:36', '2020-11-11 01:00:36', 'Active', 'No'),
(681, 'propagandaco@yahoo.com', '', '2020-11-11 03:45:47', '2020-11-11 03:45:47', 'Active', 'No'),
(682, 'yarosh.ser@gmail.com', '', '2020-11-11 06:20:38', '2020-11-11 06:20:38', 'Active', 'No'),
(683, 'phorn9477@gmail.com', '', '2020-11-11 07:53:26', '2020-11-11 07:53:26', 'Active', 'No'),
(684, 'phorn9477@gmail.com', '', '2020-11-11 07:53:34', '2020-11-11 07:53:34', 'Active', 'No'),
(685, 'wjholkamp@gmail.com', '', '2020-11-11 09:13:01', '2020-11-11 09:13:01', 'Active', 'No'),
(686, 'yorkjustin@hotmail.com', '', '2020-11-11 13:13:51', '2020-11-11 13:13:51', 'Active', 'No'),
(687, 'toriesherri@gmail.com', '', '2020-11-11 17:11:07', '2020-11-11 17:11:07', 'Active', 'No'),
(688, 'cheyenne8bella@gmail.com', '', '2020-11-11 18:33:18', '2020-11-11 18:33:18', 'Active', 'No'),
(689, 'lusine@chessparktavern.com', '', '2020-11-11 20:11:37', '2020-11-11 20:11:37', 'Active', 'No'),
(690, 'lusine@bigmamaspizza.com', '', '2020-11-11 20:45:54', '2020-11-11 20:45:54', 'Active', 'No'),
(691, 'mballesteros@pcjl.com', '', '2020-11-11 21:08:50', '2020-11-11 21:08:50', 'Active', 'No'),
(692, 'newdawncwc@gmail.com', '', '2020-11-12 00:12:57', '2020-11-12 00:12:57', 'Active', 'No'),
(693, 'srh4791@me.com', '', '2020-11-12 00:56:37', '2020-11-12 00:56:37', 'Active', 'No'),
(694, 'heath.amber10@yahoo.com', '', '2020-11-12 04:14:26', '2020-11-12 04:14:26', 'Active', 'No'),
(695, 'jhauser@kw.com', '', '2020-11-12 04:46:52', '2020-11-12 04:46:52', 'Active', 'No'),
(696, 'cltrats@yahoo.com', '', '2020-11-12 07:04:29', '2020-11-12 07:04:29', 'Active', 'No'),
(697, 'vale96ventu@hotmail.it', '', '2020-11-12 10:13:53', '2020-11-12 10:13:53', 'Active', 'No'),
(698, 'rringma@gmail.com', '', '2020-11-12 16:27:44', '2020-11-12 16:27:44', 'Active', 'No'),
(699, 'urvashitikmani1310@gmai.com', 'Urvashi', '2020-11-12 18:09:39', '2020-11-12 18:09:39', 'Active', 'No'),
(700, 'laxmipagare99@gmail.com', 'kalyani', '2020-11-12 18:14:42', '2020-11-12 18:14:42', 'Active', 'No'),
(701, 'tony@tonydickinson.net', '', '2020-11-12 19:05:02', '2020-11-12 19:05:02', 'Active', 'No'),
(702, 'jade.hunt95@gmail.com', '', '2020-11-12 20:49:41', '2020-11-12 20:49:41', 'Active', 'No'),
(703, 'TONYBAMBONY@YAHOO.COM', '', '2020-11-12 21:52:04', '2020-11-12 21:52:04', 'Active', 'No'),
(704, 'xmrcat@hotmail.com', '', '2020-11-12 23:03:25', '2020-11-12 23:03:25', 'Active', 'No'),
(705, 'mattjholmes@live.com', '', '2020-11-12 23:16:50', '2020-11-12 23:16:50', 'Active', 'No'),
(706, 'lozou@hotmail.com', '', '2020-11-12 23:36:30', '2020-11-12 23:36:30', 'Active', 'No'),
(707, 'will.clark@dbbstu.catholic.edu.au', '', '2020-11-13 00:08:50', '2020-11-13 00:08:50', 'Active', 'No'),
(708, 'jenandbob_1997@yahoo.com', '', '2020-11-13 00:32:21', '2020-11-13 00:32:21', 'Active', 'No'),
(709, 'brookwebb@comcast.net', '', '2020-11-13 00:57:49', '2020-11-13 00:57:49', 'Active', 'No'),
(710, 'joshcorbeil@gmail.com', '', '2020-11-13 02:02:36', '2020-11-13 02:02:36', 'Active', 'No'),
(711, 'bad-bad-boy-059@hotmail.com', '', '2020-11-13 02:45:07', '2020-11-13 02:45:07', 'Active', 'No'),
(712, 'rtgroombridge@bresnan.net', '', '2020-11-13 03:37:01', '2020-11-13 03:37:01', 'Active', 'No'),
(713, 'jaykap80@hotmail.com', '', '2020-11-13 04:31:27', '2020-11-13 04:31:27', 'Active', 'No'),
(714, 'yadushah@att.net', '', '2020-11-13 07:57:44', '2020-11-13 07:57:44', 'Active', 'No'),
(715, 'ashar.prithvish@gmail.com', '', '2020-11-13 09:15:35', '2020-11-13 09:15:35', 'Active', 'No'),
(716, 'ITSUPPORT@MONROEWA.GOV', '', '2020-11-13 13:00:33', '2020-11-13 13:00:33', 'Active', 'No'),
(717, 'tsokanos@gmail.com', '', '2020-11-13 13:31:41', '2020-11-13 13:31:41', 'Active', 'No'),
(718, 'karl8335755@gmail.com', '', '2020-11-13 15:35:50', '2020-11-13 15:35:50', 'Active', 'No'),
(719, 'Tyw@gerberengineering.com', '', '2020-11-13 18:59:16', '2020-11-13 18:59:16', 'Active', 'No'),
(720, 'jacob.t98@hotmail.com', '', '2020-11-13 19:04:05', '2020-11-13 19:04:05', 'Active', 'No'),
(721, 'sammvannx@aol.com', '', '2020-11-13 19:04:20', '2020-11-13 19:04:20', 'Active', 'No'),
(722, 'erikka316@gmail.com', '', '2020-11-13 19:05:36', '2020-11-13 19:05:36', 'Active', 'No'),
(723, 'rcochran619@gmail.com', '', '2020-11-13 19:18:47', '2020-11-13 19:18:47', 'Active', 'No'),
(724, 'natech_development@gmail.com', '', '2020-11-13 19:25:02', '2020-11-13 19:25:02', 'Active', 'No'),
(725, 'lamourd@telusplanet.net', '', '2020-11-13 19:34:53', '2020-11-13 19:34:53', 'Active', 'No'),
(726, 'almeda_smart@yahoo.com', '', '2020-11-13 20:03:09', '2020-11-13 20:03:09', 'Active', 'No'),
(727, 'almeda_smart@yahoo.com', '', '2020-11-13 20:03:11', '2020-11-13 20:03:11', 'Active', 'No'),
(728, 'moultrie.annette@gmail.com', '', '2020-11-13 20:03:13', '2020-11-13 20:03:13', 'Active', 'No'),
(729, 'maxmcmaster173@gmail.com', '', '2020-11-13 20:28:16', '2020-11-13 20:28:16', 'Active', 'No'),
(730, 'chodude@hotmail.com', '', '2020-11-13 21:04:23', '2020-11-13 21:04:23', 'Active', 'No'),
(731, 'tracylyn90@hotmail.com', '', '2020-11-13 21:24:10', '2020-11-13 21:24:10', 'Active', 'No'),
(732, 'kirk_rowdon@yahoo.com', '', '2020-11-13 22:08:44', '2020-11-13 22:08:44', 'Active', 'No'),
(733, 'randi_parente@yahoo.com', '', '2020-11-14 00:58:13', '2020-11-14 00:58:13', 'Active', 'No'),
(734, 'nickiechristin@gmail.com', '', '2020-11-14 01:25:15', '2020-11-14 01:25:15', 'Active', 'No'),
(735, 'l-hackett@sbcglobal.net', '', '2020-11-14 01:27:29', '2020-11-14 01:27:29', 'Active', 'No'),
(736, 'STODDARDSHARON@YAHOO.COM', '', '2020-11-14 01:43:10', '2020-11-14 01:43:10', 'Active', 'No'),
(737, 'shon@armorpestdefense.com', '', '2020-11-14 01:45:09', '2020-11-14 01:45:09', 'Active', 'No'),
(738, 'shon@armorpestdefense.com', '', '2020-11-14 01:45:10', '2020-11-14 01:45:10', 'Active', 'No'),
(739, 'LINMREED@COMCAST.NET', '', '2020-11-14 02:41:58', '2020-11-14 02:41:58', 'Active', 'No'),
(740, 'gentikajo@gmail.com', '', '2020-11-14 02:44:00', '2020-11-14 02:44:00', 'Active', 'No'),
(741, 'occasions@davidagri.fr', '', '2020-11-14 03:31:38', '2020-11-14 03:31:38', 'Active', 'No'),
(742, 'skyguygary@hotmail.com', '', '2020-11-14 03:43:55', '2020-11-14 03:43:55', 'Active', 'No'),
(743, 'secota3@aol.com', '', '2020-11-14 04:34:07', '2020-11-14 04:34:07', 'Active', 'No'),
(744, 'samund3072@aol.comcast', '', '2020-11-14 05:03:09', '2020-11-14 05:03:09', 'Active', 'No'),
(745, 'Dhollandbrynnaleah@gmail.com', '', '2020-11-14 05:23:44', '2020-11-14 05:23:44', 'Active', 'No'),
(746, 'looster@msn.com', '', '2020-11-14 05:58:35', '2020-11-14 05:58:35', 'Active', 'No'),
(747, 'billing@barkerbuccimalone.com', '', '2020-11-14 06:30:12', '2020-11-14 06:30:12', 'Active', 'No'),
(748, 'mecagri.direction@wanadoo.fr', '', '2020-11-14 17:40:40', '2020-11-14 17:40:40', 'Active', 'No'),
(749, 'menatala@gmail.com', '', '2020-11-14 18:44:20', '2020-11-14 18:44:20', 'Active', 'No'),
(750, 'Angelic.arquette@yahoo.com', '', '2020-11-14 21:25:52', '2020-11-14 21:25:52', 'Active', 'No'),
(751, 'docspoonbill@gmail.com', '', '2020-11-14 21:26:18', '2020-11-14 21:26:18', 'Active', 'No'),
(752, 'nicolejoyfarr@gmail.com', '', '2020-11-14 22:46:08', '2020-11-14 22:46:08', 'Active', 'No'),
(753, 'kenzieparkin@hotmail.com', '', '2020-11-15 06:59:51', '2020-11-15 06:59:51', 'Active', 'No'),
(754, 'ofelialind@yahoo.com', '', '2020-11-15 22:03:48', '2020-11-15 22:03:48', 'Active', 'No'),
(755, 'ofelialind@yahoo.com', '', '2020-11-15 22:03:50', '2020-11-15 22:03:50', 'Active', 'No'),
(756, 'jadedwatcher52@gmail.com', '', '2020-11-16 10:21:29', '2020-11-16 10:21:29', 'Active', 'No'),
(757, 'THEMIMIMAYER@SBCGLOBAL.NET', '', '2020-11-16 22:11:57', '2020-11-16 22:11:57', 'Active', 'No'),
(758, 'angelcitytalent@sbcglobal.net', '', '2020-11-16 22:34:59', '2020-11-16 22:34:59', 'Active', 'No'),
(759, 'monnie_christopherson@yahoo.com', '', '2020-11-17 02:54:23', '2020-11-17 02:54:23', 'Active', 'No'),
(760, 'monnie_christopherson@yahoo.com', '', '2020-11-17 02:54:24', '2020-11-17 02:54:24', 'Active', 'No'),
(761, 'gmont095@gmail.com', '', '2020-11-17 02:57:18', '2020-11-17 02:57:18', 'Active', 'No'),
(762, 'Mr.rafaelanaya@gmail.com', '', '2020-11-17 04:24:40', '2020-11-17 04:24:40', 'Active', 'No'),
(763, 'commercialfirstaid@charter.net', '', '2020-11-17 10:01:55', '2020-11-17 10:01:55', 'Active', 'No'),
(764, 'sochnacka@gmail.com', '', '2020-11-17 11:16:25', '2020-11-17 11:16:25', 'Active', 'No'),
(765, 'owen@gotpower.com', '', '2020-11-17 15:05:50', '2020-11-17 15:05:50', 'Active', 'No'),
(766, 'developer@nutridock.com', 'Saurabh', '2020-11-17 18:05:04', '2020-11-17 18:05:04', 'Active', 'No'),
(767, 'info@gotpower.com', '', '2020-11-17 19:27:02', '2020-11-17 19:27:02', 'Active', 'No'),
(768, 'd.munguia@hotmail.com', '', '2020-11-17 19:35:55', '2020-11-17 19:35:55', 'Active', 'No'),
(769, 'DAPHNE_K_SOLIS@YAHOO.COM', '', '2020-11-17 19:58:22', '2020-11-17 19:58:22', 'Active', 'No'),
(770, 'junmalana@gmail.com', '', '2020-11-17 21:12:31', '2020-11-17 21:12:31', 'Active', 'No'),
(771, 'sehmbidavinder@gmail.com', '', '2020-11-17 21:13:29', '2020-11-17 21:13:29', 'Active', 'No'),
(772, 'stroupmajorie@yahoo.com', '', '2020-11-17 21:30:13', '2020-11-17 21:30:13', 'Active', 'No'),
(773, 'stroupmajorie@yahoo.com', '', '2020-11-17 21:30:14', '2020-11-17 21:30:14', 'Active', 'No'),
(774, 'bonnie@nev-calconst.com', '', '2020-11-17 21:50:15', '2020-11-17 21:50:15', 'Active', 'No'),
(775, 'piyusharora6505@gmail.com', '', '2020-11-17 22:16:33', '2020-11-17 22:16:33', 'Active', 'No'),
(776, 'megharathi7@gmail.com', '', '2020-11-17 22:37:22', '2020-11-17 22:37:22', 'Active', 'No'),
(777, 'megharathi7@gmail.com', '', '2020-11-17 22:37:41', '2020-11-17 22:37:41', 'Active', 'No'),
(778, 'SHADI_CHEEKY@YAHOO.COM', '', '2020-11-17 22:57:16', '2020-11-17 22:57:16', 'Active', 'No'),
(779, 'jimdimitroff@yahoo.com', '', '2020-11-17 22:59:07', '2020-11-17 22:59:07', 'Active', 'No'),
(780, 'appleuniformselpaso@yahoo.com', '', '2020-11-17 23:41:12', '2020-11-17 23:41:12', 'Active', 'No'),
(781, 'patience.mcguire@gmail.com', '', '2020-11-18 00:03:25', '2020-11-18 00:03:25', 'Active', 'No'),
(782, 'mahajandk6447@gmail.com', '', '2020-11-18 01:31:40', '2020-11-18 01:31:40', 'Active', 'No'),
(783, 'quranyellow@yahoo.com', '', '2020-11-18 01:49:16', '2020-11-18 01:49:16', 'Active', 'No'),
(784, 'frogweber@aol.com', '', '2020-11-18 01:51:01', '2020-11-18 01:51:01', 'Active', 'No'),
(785, 'eddiejn@comcast.net', '', '2020-11-18 01:56:34', '2020-11-18 01:56:34', 'Active', 'No'),
(786, 'marcia.vieira@farfetch.com', '', '2020-11-18 02:41:41', '2020-11-18 02:41:41', 'Active', 'No'),
(787, 'aksmileyriley@gmail.com', '', '2020-11-18 06:16:16', '2020-11-18 06:16:16', 'Active', 'No'),
(788, 'shettyrocks.ss@gmail.com', '', '2020-11-18 07:12:43', '2020-11-18 07:12:43', 'Active', 'No'),
(789, 'anjali@victorindia.com', '', '2020-11-18 10:18:30', '2020-11-18 10:18:30', 'Active', 'No'),
(790, 'deshpandeamit19@gmail.com', '', '2020-11-18 12:20:20', '2020-11-18 12:20:20', 'Active', 'No'),
(791, 'sanjeet.singh084@gmail.com', '', '2020-11-18 19:58:39', '2020-11-18 19:58:39', 'Active', 'No'),
(792, 'angelcitytalent@gmail.com', '', '2020-11-18 20:56:17', '2020-11-18 20:56:17', 'Active', 'No'),
(793, 'angelcitytalent@sbcglobal.net', '', '2020-11-18 21:16:20', '2020-11-18 21:16:20', 'Active', 'No'),
(794, 'COURTNEYBOW1361@GMAIL.COM', '', '2020-11-19 00:20:38', '2020-11-19 00:20:38', 'Active', 'No'),
(795, 'GR8TWITEHUNTER@YAHOO.COM', '', '2020-11-19 00:21:28', '2020-11-19 00:21:28', 'Active', 'No'),
(796, 'mramirez@aerosupplyusa.com', '', '2020-11-19 02:29:12', '2020-11-19 02:29:12', 'Active', 'No'),
(797, 'bonnie@nev-calconst.com', '', '2020-11-19 07:12:32', '2020-11-19 07:12:32', 'Active', 'No'),
(798, 'ilovelola206@gmail.com', '', '2020-11-19 07:42:19', '2020-11-19 07:42:19', 'Active', 'No'),
(799, 'kevinkemper2@web.de', '', '2020-11-19 19:02:57', '2020-11-19 19:02:57', 'Active', 'No'),
(800, 'bbaumann@csicable.net', '', '2020-11-19 20:53:13', '2020-11-19 20:53:13', 'Active', 'No'),
(801, 'obiehenney@yahoo.com', '', '2020-11-19 22:05:56', '2020-11-19 22:05:56', 'Active', 'No'),
(802, 'efcliu.fm@gmail.com', '', '2020-11-20 00:51:17', '2020-11-20 00:51:17', 'Active', 'No'),
(803, 'bonnie@nev-calconst.com', '', '2020-11-20 01:41:12', '2020-11-20 01:41:12', 'Active', 'No'),
(804, 'MMBBHODGE@GMAIL.COM', '', '2020-11-20 02:00:09', '2020-11-20 02:00:09', 'Active', 'No'),
(805, 'ART@AMPELECTRIC.NET', '', '2020-11-20 02:30:30', '2020-11-20 02:30:30', 'Active', 'No'),
(806, 'tgif13@cox.net', '', '2020-11-20 02:55:29', '2020-11-20 02:55:29', 'Active', 'No'),
(807, 'carlos2012ccb@hotmail.com', '', '2020-11-20 09:31:48', '2020-11-20 09:31:48', 'Active', 'No'),
(808, 'commercialfirstaid@charter.net', '', '2020-11-20 13:04:07', '2020-11-20 13:04:07', 'Active', 'No'),
(809, 'billphillips09@gmail.com', '', '2020-11-20 17:06:39', '2020-11-20 17:06:39', 'Active', 'No'),
(810, 'joet153@gmail.com', '', '2020-11-20 18:50:42', '2020-11-20 18:50:42', 'Active', 'No'),
(811, 'bonnie@nev-calconst.com', '', '2020-11-20 23:21:02', '2020-11-20 23:21:02', 'Active', 'No'),
(812, 'CHRIS.SCHEMMER@GMAIL.COM', '', '2020-11-21 00:11:12', '2020-11-21 00:11:12', 'Active', 'No'),
(813, 'whiteshewolf75@yahoo.com', '', '2020-11-21 01:36:40', '2020-11-21 01:36:40', 'Active', 'No'),
(814, 'ntaylor1928@yahoo.com', '', '2020-11-21 02:38:27', '2020-11-21 02:38:27', 'Active', 'No'),
(815, 'yalemk9@gmail.com', '', '2020-11-21 02:41:30', '2020-11-21 02:41:30', 'Active', 'No'),
(816, 'ddj5892608@aol.com', '', '2020-11-21 04:08:25', '2020-11-21 04:08:25', 'Active', 'No'),
(817, 'emusoner@stu.norwich.edu', '', '2020-11-21 04:22:01', '2020-11-21 04:22:01', 'Active', 'No'),
(818, 'jesper.seattle@gmail.com', '', '2020-11-21 04:48:32', '2020-11-21 04:48:32', 'Active', 'No'),
(819, 'mizunow@aol.com', '', '2020-11-21 06:16:18', '2020-11-21 06:16:18', 'Active', 'No'),
(820, 'bellaelwart45@gmail.com', '', '2020-11-21 06:43:26', '2020-11-21 06:43:26', 'Active', 'No'),
(821, 'marksantiago826@yahoo.com', '', '2020-11-21 16:43:40', '2020-11-21 16:43:40', 'Active', 'No'),
(822, 'occasion@dupuy-agri.com', '', '2020-11-21 18:30:00', '2020-11-21 18:30:00', 'Active', 'No'),
(823, 'dairyboss1357@gmail.com', '', '2020-11-21 19:15:39', '2020-11-21 19:15:39', 'Active', 'No'),
(824, 'jkonn@sbcglobal.net', '', '2020-11-21 23:15:55', '2020-11-21 23:15:55', 'Active', 'No'),
(825, 'studio206id@gmail.com', '', '2020-11-22 04:41:43', '2020-11-22 04:41:43', 'Active', 'No'),
(826, 'bwilsonrp@cox.net', '', '2020-11-22 05:29:04', '2020-11-22 05:29:04', 'Active', 'No'),
(827, 'dserata@aol.com', '', '2020-11-22 06:31:55', '2020-11-22 06:31:55', 'Active', 'No'),
(828, 'khanshoeb143@gmail.com', '', '2020-11-22 10:55:29', '2020-11-22 10:55:29', 'Active', 'No'),
(829, 'aniket@wersolar.in', '', '2020-11-22 13:31:42', '2020-11-22 13:31:42', 'Active', 'No'),
(830, 'CRUDD@CHSHOUSING.ORG', '', '2020-11-22 16:45:22', '2020-11-22 16:45:22', 'Active', 'No'),
(831, 'jlilyrose551@gmail.com', '', '2020-11-23 01:19:21', '2020-11-23 01:19:21', 'Active', 'No'),
(832, 'enndalbouchra9@gmail.com', '', '2020-11-23 03:06:57', '2020-11-23 03:06:57', 'Active', 'No'),
(833, 'suryapancham62@gmail.com', '', '2020-11-23 04:35:12', '2020-11-23 04:35:12', 'Active', 'No'),
(834, 'hrld_sleeper@yahoo.com', '', '2020-11-23 11:09:20', '2020-11-23 11:09:20', 'Active', 'No'),
(835, 'developer@nutridock.com', '', '2020-11-23 17:11:43', '2020-11-23 17:11:43', 'Active', 'No'),
(836, 'Lmhuynh@aol.com', '', '2020-11-23 18:13:25', '2020-11-23 18:13:25', 'Active', 'No'),
(837, 'caribbean.pirate15@gmail.com', '', '2020-11-23 20:31:32', '2020-11-23 20:31:32', 'Active', 'No'),
(838, 'commercialfirstaid@charter.net', '', '2020-11-23 21:37:24', '2020-11-23 21:37:24', 'Active', 'No'),
(839, 'donnainvan@gmail.com', '', '2020-11-24 00:21:58', '2020-11-24 00:21:58', 'Active', 'No'),
(840, 'aimee.rife@scasurgery.com', '', '2020-11-24 00:40:59', '2020-11-24 00:40:59', 'Active', 'No'),
(841, 'bountyhunter423@comcast.net', '', '2020-11-24 01:12:44', '2020-11-24 01:12:44', 'Active', 'No'),
(842, 'kalcotter@gmail.com', '', '2020-11-24 02:08:38', '2020-11-24 02:08:38', 'Active', 'No'),
(843, 'srushti.varma1920@gmail.com', '', '2020-11-24 02:25:28', '2020-11-24 02:25:28', 'Active', 'No'),
(844, 'muxlow.julieta@yahoo.com', '', '2020-11-24 02:43:12', '2020-11-24 02:43:12', 'Active', 'No'),
(845, 'muxlow.julieta@yahoo.com', '', '2020-11-24 02:43:14', '2020-11-24 02:43:14', 'Active', 'No'),
(846, 'tammara.yeomans@yahoo.com', '', '2020-11-24 03:05:13', '2020-11-24 03:05:13', 'Active', 'No'),
(847, 'boonreing2@yahoo.com', '', '2020-11-24 03:24:03', '2020-11-24 03:24:03', 'Active', 'No'),
(848, 'herbert.noehren@t-online.de', '', '2020-11-24 04:16:02', '2020-11-24 04:16:02', 'Active', 'No'),
(849, 'ragland.jason@gmail.com', '', '2020-11-24 04:20:20', '2020-11-24 04:20:20', 'Active', 'No'),
(850, 'christophercuevo@yahoo.com', '', '2020-11-24 06:40:57', '2020-11-24 06:40:57', 'Active', 'No'),
(851, 'bonnie@nev-calconst.com', '', '2020-11-24 08:28:45', '2020-11-24 08:28:45', 'Active', 'No'),
(852, 'sadiesuperstar@gmail.com', '', '2020-11-24 09:55:06', '2020-11-24 09:55:06', 'Active', 'No'),
(853, 'dainadane@hotmail.com', '', '2020-11-24 13:02:03', '2020-11-24 13:02:03', 'Active', 'No'),
(854, 'bnblasetti@aol.com', '', '2020-11-24 16:50:38', '2020-11-24 16:50:38', 'Active', 'No'),
(855, 'jlew70@msn.com', '', '2020-11-24 18:55:01', '2020-11-24 18:55:01', 'Active', 'No'),
(856, 'ANDREW@JLAB.ORG', '', '2020-11-24 19:35:57', '2020-11-24 19:35:57', 'Active', 'No'),
(857, 'timothy.a.dummer@gmail.com', '', '2020-11-24 20:34:31', '2020-11-24 20:34:31', 'Active', 'No'),
(858, 'ANDREW@JLAB.ORG', '', '2020-11-24 21:02:04', '2020-11-24 21:02:04', 'Active', 'No'),
(859, 'hrishikeshnikam1996@gmail.com', '', '2020-11-24 22:02:52', '2020-11-24 22:02:52', 'Active', 'No'),
(860, 'hrishikeshnikam1996@gmail.com', '', '2020-11-24 22:03:13', '2020-11-24 22:03:13', 'Active', 'No'),
(861, 'NCAAREF2001@YAHOO.COM', '', '2020-11-24 23:23:23', '2020-11-24 23:23:23', 'Active', 'No'),
(862, 'NICOLEBERG15@GMAIL.COM', '', '2020-11-25 00:50:23', '2020-11-25 00:50:23', 'Active', 'No'),
(863, 'atunicus@yahoo.com', '', '2020-11-25 01:54:24', '2020-11-25 01:54:24', 'Active', 'No'),
(864, 'commercialfirstaid@charter.net', '', '2020-11-25 07:40:26', '2020-11-25 07:40:26', 'Active', 'No'),
(865, 'Don@colortechmfg.com', '', '2020-11-25 13:15:26', '2020-11-25 13:15:26', 'Active', 'No'),
(866, 'JLATVALA@SBSFOODS.COM', '', '2020-11-25 17:10:56', '2020-11-25 17:10:56', 'Active', 'No'),
(867, 'AMERICANHEATCOOL@VERIZON.NET', '', '2020-11-25 17:34:15', '2020-11-25 17:34:15', 'Active', 'No'),
(868, 'supplies@therapyspecialists.net', '', '2020-11-25 22:35:36', '2020-11-25 22:35:36', 'Active', 'No'),
(869, 'kimtashjian@hotmail.com', '', '2020-11-25 22:37:37', '2020-11-25 22:37:37', 'Active', 'No'),
(870, 'antoniafernandez031@gmail.com', '', '2020-11-26 01:57:03', '2020-11-26 01:57:03', 'Active', 'No'),
(871, 'reeserrc@hotmail.com', '', '2020-11-26 02:18:46', '2020-11-26 02:18:46', 'Active', 'No'),
(872, 'MARTHAHODGES@HOTMAIL.COM', '', '2020-11-26 02:20:56', '2020-11-26 02:20:56', 'Active', 'No'),
(873, 'Kmayers@verizon.net', '', '2020-11-26 03:49:44', '2020-11-26 03:49:44', 'Active', 'No'),
(874, 'DIGITALCARAUDIO@AOL.COM', '', '2020-11-26 07:36:55', '2020-11-26 07:36:55', 'Active', 'No'),
(875, 'jamesfamily013@gmail.com', '', '2020-11-26 07:46:23', '2020-11-26 07:46:23', 'Active', 'No'),
(876, 'kalcotter@gmail.com', '', '2020-11-26 08:24:36', '2020-11-26 08:24:36', 'Active', 'No'),
(877, 'dkdist74@aol.com', '', '2020-11-26 09:23:10', '2020-11-26 09:23:10', 'Active', 'No'),
(878, 'JAKCASAL@YAHOO.COM', '', '2020-11-26 11:01:11', '2020-11-26 11:01:11', 'Active', 'No'),
(879, 'JLATVALA@SBSFOODS.COM', '', '2020-11-26 18:06:41', '2020-11-26 18:06:41', 'Active', 'No'),
(880, 'jeniferfenton@icloud.com', '', '2020-11-26 18:34:11', '2020-11-26 18:34:11', 'Active', 'No'),
(881, 'xd.stiwi007@gmail.com', '', '2020-11-26 18:35:22', '2020-11-26 18:35:22', 'Active', 'No'),
(882, 'alipova.bakhyt@gmail.com', '', '2020-11-26 18:51:08', '2020-11-26 18:51:08', 'Active', 'No'),
(883, 'rajesh@expressinnindia.com', '', '2020-11-26 19:16:07', '2020-11-26 19:16:07', 'Active', 'No'),
(884, 'fnbm@expressinnindia.com', '', '2020-11-26 19:16:38', '2020-11-26 19:16:38', 'Active', 'No'),
(885, 'AMERICANHEATCOOL@VERIZON.NET', '', '2020-11-26 20:30:44', '2020-11-26 20:30:44', 'Active', 'No'),
(886, 'cvsa7777@gmail.com', '', '2020-11-26 21:52:50', '2020-11-26 21:52:50', 'Active', 'No'),
(887, 'lherger@oliveboutiquehotel.com', '', '2020-11-26 23:16:44', '2020-11-26 23:16:44', 'Active', 'No'),
(888, 'KSAPARO@AOL.COM', '', '2020-11-26 23:23:16', '2020-11-26 23:23:16', 'Active', 'No'),
(889, 'jbalint@alltradeky.com', '', '2020-11-26 23:37:39', '2020-11-26 23:37:39', 'Active', 'No'),
(890, 'wecare@paypal.com', '', '2020-11-27 00:16:29', '2020-11-27 00:16:29', 'Active', 'No'),
(891, 'Don@colortechmfg.com', '', '2020-11-27 00:28:31', '2020-11-27 00:28:31', 'Active', 'No'),
(892, 'reeserrc@hotmail.com', '', '2020-11-27 00:50:15', '2020-11-27 00:50:15', 'Active', 'No'),
(893, 'DIGITALCARAUDIO@AOL.COM', '', '2020-11-27 01:01:51', '2020-11-27 01:01:51', 'Active', 'No'),
(894, 'rosjea6718@students.ecpi.edu', '', '2020-11-27 05:26:37', '2020-11-27 05:26:37', 'Active', 'No'),
(895, 'RBULLITT@ALLTRADEKY.COM', '', '2020-11-27 06:55:43', '2020-11-27 06:55:43', 'Active', 'No'),
(896, 'shanell.roydon@yahoo.com', '', '2020-11-27 07:42:32', '2020-11-27 07:42:32', 'Active', 'No'),
(897, 'WAYNE@WITTFENCE.COM', '', '2020-11-27 07:43:53', '2020-11-27 07:43:53', 'Active', 'No'),
(898, 'jlcooper@carleton.edu', '', '2020-11-27 07:55:23', '2020-11-27 07:55:23', 'Active', 'No'),
(899, 'mmaltese@washingtonpavilion.org', '', '2020-11-27 08:00:07', '2020-11-27 08:00:07', 'Active', 'No'),
(900, 'ccostanzasantos@flmtc.com', '', '2020-11-27 09:29:59', '2020-11-27 09:29:59', 'Active', 'No'),
(901, 'halewoodmargarete@yahoo.com', '', '2020-11-27 10:59:24', '2020-11-27 10:59:24', 'Active', 'No'),
(902, 'halewoodmargarete@yahoo.com', '', '2020-11-27 10:59:26', '2020-11-27 10:59:26', 'Active', 'No'),
(903, 'andreas.kjoeller.christensen@gmail.com', '', '2020-11-27 11:14:25', '2020-11-27 11:14:25', 'Active', 'No'),
(904, 'hayden.dana@gmail.com', '', '2020-11-27 13:13:51', '2020-11-27 13:13:51', 'Active', 'No'),
(905, 'AY@ICONAUTOMATIONLLC.COM', '', '2020-11-27 17:08:50', '2020-11-27 17:08:50', 'Active', 'No'),
(906, 'courtneybellecomstock@gmail.com', '', '2020-11-27 18:52:20', '2020-11-27 18:52:20', 'Active', 'No'),
(907, 'brittanyeavila@aol.com', '', '2020-11-27 21:17:09', '2020-11-27 21:17:09', 'Active', 'No'),
(908, 'brittanyeavila@aol.com', '', '2020-11-27 21:17:15', '2020-11-27 21:17:15', 'Active', 'No'),
(909, 'rhpalmdesert@aol.com', '', '2020-11-27 21:45:50', '2020-11-27 21:45:50', 'Active', 'No'),
(910, 'rhpalmdesert@aol.com', '', '2020-11-27 21:45:51', '2020-11-27 21:45:51', 'Active', 'No'),
(911, 'jdnorwood1@att.net', '', '2020-11-27 22:16:04', '2020-11-27 22:16:04', 'Active', 'No'),
(912, 'w.mason50@yahoo.com', '', '2020-11-27 22:35:51', '2020-11-27 22:35:51', 'Active', 'No'),
(913, 'bandomerj@yahoo.com', '', '2020-11-27 23:38:09', '2020-11-27 23:38:09', 'Active', 'No'),
(914, 'supergirl19_us@yahoo.com', '', '2020-11-28 00:03:12', '2020-11-28 00:03:12', 'Active', 'No'),
(915, 'supergirl19_us@yahoo.com', '', '2020-11-28 00:03:14', '2020-11-28 00:03:14', 'Active', 'No'),
(916, 'ccostanzasantos@flmtc.com', '', '2020-11-28 01:42:34', '2020-11-28 01:42:34', 'Active', 'No'),
(917, 'doostimerchant@yahoo.com', '', '2020-11-28 02:10:30', '2020-11-28 02:10:30', 'Active', 'No'),
(918, 'aithanger@yahoo.com', '', '2020-11-28 02:39:26', '2020-11-28 02:39:26', 'Active', 'No'),
(919, 'aithanger@yahoo.com', '', '2020-11-28 02:39:28', '2020-11-28 02:39:28', 'Active', 'No'),
(920, 'JLATVALA@SBSFOODS.COM', '', '2020-11-28 02:54:45', '2020-11-28 02:54:45', 'Active', 'No'),
(921, 'randconparog@gmail.com', '', '2020-11-28 03:46:30', '2020-11-28 03:46:30', 'Active', 'No'),
(922, 'randconparog@gmail.com', '', '2020-11-28 03:46:31', '2020-11-28 03:46:31', 'Active', 'No'),
(923, 'mike.paradise@thompsonschools.org', '', '2020-11-28 06:16:44', '2020-11-28 06:16:44', 'Active', 'No'),
(924, 'bonnie@nev-calconst.com', '', '2020-11-28 06:59:40', '2020-11-28 06:59:40', 'Active', 'No'),
(925, 'ewconsul@aol.com', '', '2020-11-28 07:13:51', '2020-11-28 07:13:51', 'Active', 'No'),
(926, 'ewconsul@aol.com', '', '2020-11-28 07:13:52', '2020-11-28 07:13:52', 'Active', 'No'),
(927, 'psacmon@optonline.net', '', '2020-11-28 09:05:56', '2020-11-28 09:05:56', 'Active', 'No'),
(928, 'linds8706@yahoo.com', '', '2020-11-28 12:50:08', '2020-11-28 12:50:08', 'Active', 'No'),
(929, 'supergirl19_us@yahoo.com', '', '2020-11-28 14:32:43', '2020-11-28 14:32:43', 'Active', 'No'),
(930, 'supergirl19_us@yahoo.com', '', '2020-11-28 14:32:45', '2020-11-28 14:32:45', 'Active', 'No'),
(931, 'susan.friede@thompsonschools.org', '', '2020-11-28 15:27:09', '2020-11-28 15:27:09', 'Active', 'No'),
(932, 'WAYNE@WITTFENCE.COM', '', '2020-11-28 15:32:28', '2020-11-28 15:32:28', 'Active', 'No'),
(933, 'sawyermb@verizon.net', '', '2020-11-29 03:57:16', '2020-11-29 03:57:16', 'Active', 'No'),
(934, 'hbatt012@gmail.com', '', '2020-11-29 04:01:41', '2020-11-29 04:01:41', 'Active', 'No'),
(935, 'shellcooponeill@aol.com', '', '2020-11-29 04:32:41', '2020-11-29 04:32:41', 'Active', 'No'),
(936, 'chinhle13@gmail.com', '', '2020-11-29 08:47:22', '2020-11-29 08:47:22', 'Active', 'No'),
(937, 'broderick.joetta@yahoo.com', '', '2020-11-29 09:41:57', '2020-11-29 09:41:57', 'Active', 'No'),
(938, 'broderick.joetta@yahoo.com', '', '2020-11-29 09:41:59', '2020-11-29 09:41:59', 'Active', 'No'),
(939, 'mike.paradise@thompsonschools.org', '', '2020-11-29 17:26:54', '2020-11-29 17:26:54', 'Active', 'No'),
(940, 'queeniedarleen@sbcglobal.net', '', '2020-11-29 18:32:08', '2020-11-29 18:32:08', 'Active', 'No'),
(941, 'queeniedarleen@sbcglobal.net', '', '2020-11-29 18:32:11', '2020-11-29 18:32:11', 'Active', 'No'),
(942, 'tomcook@emailuser.net', '', '2020-11-29 20:04:26', '2020-11-29 20:04:26', 'Active', 'No'),
(943, 'bmocha34@yahoo.com', '', '2020-11-29 20:30:19', '2020-11-29 20:30:19', 'Active', 'No'),
(944, 'bmocha34@yahoo.com', '', '2020-11-29 20:30:21', '2020-11-29 20:30:21', 'Active', 'No'),
(945, 'NCAAREF2001@YAHOO.COM', '', '2020-11-29 21:36:38', '2020-11-29 21:36:38', 'Active', 'No'),
(946, 'h3c107@yahoo.com', '', '2020-11-29 23:17:34', '2020-11-29 23:17:34', 'Active', 'No'),
(947, 'h3c107@yahoo.com', '', '2020-11-29 23:17:38', '2020-11-29 23:17:38', 'Active', 'No'),
(948, 'billing@supremedia.com', '', '2020-11-30 00:41:25', '2020-11-30 00:41:25', 'Active', 'No'),
(949, 'KYLE@ROOTWESTINC.COM', '', '2020-11-30 01:40:12', '2020-11-30 01:40:12', 'Active', 'No'),
(950, 'belliott@pacifichomecare.com', '', '2020-11-30 02:24:23', '2020-11-30 02:24:23', 'Active', 'No'),
(951, 'dupuis_ginger@yahoo.com', '', '2020-11-30 02:31:27', '2020-11-30 02:31:27', 'Active', 'No'),
(952, 'dupuis_ginger@yahoo.com', '', '2020-11-30 02:31:30', '2020-11-30 02:31:30', 'Active', 'No'),
(953, 'aauto@sbcglobal.net', '', '2020-11-30 03:21:10', '2020-11-30 03:21:10', 'Active', 'No'),
(954, 'patrick.lhiguinen@yahoo.fr', '', '2020-11-30 04:09:28', '2020-11-30 04:09:28', 'Active', 'No'),
(955, 'noddyorange@yahoo.com', '', '2020-11-30 06:15:25', '2020-11-30 06:15:25', 'Active', 'No'),
(956, 'rahulsapate41@gmail.com', '', '2020-11-30 08:18:58', '2020-11-30 08:18:58', 'Active', 'No'),
(957, 'MATARANTA@AOL.COM', '', '2020-11-30 11:50:54', '2020-11-30 11:50:54', 'Active', 'No'),
(958, 'sharpfinance@yahoo.com', '', '2020-11-30 12:32:40', '2020-11-30 12:32:40', 'Active', 'No'),
(959, 'sharpfinance@yahoo.com', '', '2020-11-30 12:32:46', '2020-11-30 12:32:46', 'Active', 'No'),
(960, 'rmpsuncal@aol.com', '', '2020-11-30 13:46:09', '2020-11-30 13:46:09', 'Active', 'No'),
(961, 'chakrobortyindrojit@gmail.com', '', '2020-11-30 14:52:01', '2020-11-30 14:52:01', 'Active', 'No'),
(962, 'chakrobortyindrojit@gmail.com', '', '2020-11-30 14:52:16', '2020-11-30 14:52:16', 'Active', 'No'),
(963, 'macrina.prado@yahoo.com', '', '2020-11-30 18:51:34', '2020-11-30 18:51:34', 'Active', 'No'),
(964, 'macrina.prado@yahoo.com', '', '2020-11-30 18:51:38', '2020-11-30 18:51:38', 'Active', 'No'),
(965, 'dlynns1@yahoo.com', '', '2020-11-30 19:22:11', '2020-11-30 19:22:11', 'Active', 'No'),
(966, 'dlynns1@yahoo.com', '', '2020-11-30 19:22:13', '2020-11-30 19:22:13', 'Active', 'No'),
(967, 'chinmaygadekar34@gmail.com', '', '2020-11-30 19:49:49', '2020-11-30 19:49:49', 'Active', 'No'),
(968, 'shamma.singh@verizon.net', '', '2020-11-30 20:24:09', '2020-11-30 20:24:09', 'Active', 'No'),
(969, 'shamma.singh@verizon.net', '', '2020-11-30 20:24:14', '2020-11-30 20:24:14', 'Active', 'No'),
(970, 'retrev@csh.rit.edu', '', '2020-11-30 20:45:24', '2020-11-30 20:45:24', 'Active', 'No'),
(971, 'sahilbijali30@gmail.com', '', '2020-11-30 21:27:03', '2020-11-30 21:27:03', 'Active', 'No'),
(972, 'neenee58@verizon.net', '', '2020-11-30 22:26:29', '2020-11-30 22:26:29', 'Active', 'No'),
(973, 'neenee58@verizon.net', '', '2020-11-30 22:26:31', '2020-11-30 22:26:31', 'Active', 'No'),
(974, 'ANNEWHITEHEAD2006@YAHOO.COM', '', '2020-11-30 23:09:17', '2020-11-30 23:09:17', 'Active', 'No'),
(975, 'ELIZABETHMARYBOYER@GMAIL.COM', '', '2020-11-30 23:34:04', '2020-11-30 23:34:04', 'Active', 'No'),
(976, 'moosezvi@yahoo.com', '', '2020-12-01 00:43:01', '2020-12-01 00:43:01', 'Active', 'No'),
(977, 'moosezvi@yahoo.com', '', '2020-12-01 00:43:04', '2020-12-01 00:43:04', 'Active', 'No'),
(978, 'jadhavprajesh786@gmail.com', '', '2020-12-01 00:48:51', '2020-12-01 00:48:51', 'Active', 'No'),
(979, 'marcoscabrera0925@yahoo.com', '', '2020-12-01 00:48:59', '2020-12-01 00:48:59', 'Active', 'No'),
(980, 'marcoscabrera0925@yahoo.com', '', '2020-12-01 00:49:01', '2020-12-01 00:49:01', 'Active', 'No'),
(981, 'jadhavprajesh786@gmail.com', '', '2020-12-01 00:49:08', '2020-12-01 00:49:08', 'Active', 'No'),
(982, 'mike.tapp@swc.net', '', '2020-12-01 00:51:38', '2020-12-01 00:51:38', 'Active', 'No'),
(983, 'shipstead99@yahoo.com', '', '2020-12-01 01:38:29', '2020-12-01 01:38:29', 'Active', 'No'),
(984, 'shipstead99@yahoo.com', '', '2020-12-01 01:38:31', '2020-12-01 01:38:31', 'Active', 'No'),
(985, 'jdnorwood1@att.net', '', '2020-12-01 02:12:11', '2020-12-01 02:12:11', 'Active', 'No'),
(986, 'villajessie81@yahoo.com', '', '2020-12-01 02:29:41', '2020-12-01 02:29:41', 'Active', 'No'),
(987, 'mfajr71@yahoo.com', '', '2020-12-01 02:48:44', '2020-12-01 02:48:44', 'Active', 'No'),
(988, 'mfajr71@yahoo.com', '', '2020-12-01 02:48:46', '2020-12-01 02:48:46', 'Active', 'No'),
(989, 'ckalis096@gmail.com', '', '2020-12-01 04:05:44', '2020-12-01 04:05:44', 'Active', 'No'),
(990, 'murphyfbcl@aol.com', '', '2020-12-01 07:01:04', '2020-12-01 07:01:04', 'Active', 'No'),
(991, 'murphyfbcl@aol.com', '', '2020-12-01 07:01:06', '2020-12-01 07:01:06', 'Active', 'No'),
(992, 'hbatt012@gmail.com', '', '2020-12-01 08:36:58', '2020-12-01 08:36:58', 'Active', 'No'),
(993, 'jklineelectricltd@yahoo.com', '', '2020-12-01 08:59:31', '2020-12-01 08:59:31', 'Active', 'No'),
(994, 'jklineelectricltd@yahoo.com', '', '2020-12-01 08:59:33', '2020-12-01 08:59:33', 'Active', 'No'),
(995, 'sachinlonari@gmail.com', '', '2020-12-01 09:07:26', '2020-12-01 09:07:26', 'Active', 'No'),
(996, 'nishil_20005@yahoo.com', '', '2020-12-01 12:46:26', '2020-12-01 12:46:26', 'Active', 'No'),
(997, 'kisha_duckett@yahoo.com', '', '2020-12-01 16:48:52', '2020-12-01 16:48:52', 'Active', 'No'),
(998, 'kisha_duckett@yahoo.com', '', '2020-12-01 16:48:53', '2020-12-01 16:48:53', 'Active', 'No'),
(999, 'cobsnyder@sbcglobal.net', '', '2020-12-01 18:50:42', '2020-12-01 18:50:42', 'Active', 'No'),
(1000, 'cobsnyder@sbcglobal.net', '', '2020-12-01 18:50:43', '2020-12-01 18:50:43', 'Active', 'No'),
(1001, 'iiriceeaterii@aol.com', '', '2020-12-01 19:06:35', '2020-12-01 19:06:35', 'Active', 'No'),
(1002, 'iiriceeaterii@aol.com', '', '2020-12-01 19:06:36', '2020-12-01 19:06:36', 'Active', 'No'),
(1003, 'tomwinkle@sbcglobal.net', '', '2020-12-01 20:23:32', '2020-12-01 20:23:32', 'Active', 'No'),
(1004, 'dlstackhouse@cox.net', '', '2020-12-01 20:23:42', '2020-12-01 20:23:42', 'Active', 'No'),
(1005, 'cindyhuey@cox.net', '', '2020-12-01 21:44:40', '2020-12-01 21:44:40', 'Active', 'No'),
(1006, 'bdew66@cox.net', '', '2020-12-01 22:02:47', '2020-12-01 22:02:47', 'Active', 'No'),
(1007, 'drmohan21@yahoo.com', '', '2020-12-01 22:06:49', '2020-12-01 22:06:49', 'Active', 'No'),
(1008, 'cchtchurch@aol.com', '', '2020-12-01 23:12:16', '2020-12-01 23:12:16', 'Active', 'No'),
(1009, 'cchtchurch@aol.com', '', '2020-12-01 23:12:20', '2020-12-01 23:12:20', 'Active', 'No'),
(1010, 'counterweight1@cox.net', '', '2020-12-01 23:18:37', '2020-12-01 23:18:37', 'Active', 'No'),
(1011, 'jillfischer2@yahoo.com', '', '2020-12-01 23:28:47', '2020-12-01 23:28:47', 'Active', 'No'),
(1012, 'jillfischer2@yahoo.com', '', '2020-12-01 23:28:48', '2020-12-01 23:28:48', 'Active', 'No'),
(1013, 'Smiling4you@rocketmail.com', '', '2020-12-01 23:44:37', '2020-12-01 23:44:37', 'Active', 'No'),
(1014, 'ammarajaz@yahoo.com', '', '2020-12-02 00:04:33', '2020-12-02 00:04:33', 'Active', 'No'),
(1015, 'jprather5454@yahoo.com', '', '2020-12-02 00:09:38', '2020-12-02 00:09:38', 'Active', 'No'),
(1016, 'bstine816@aol.com', '', '2020-12-02 00:41:25', '2020-12-02 00:41:25', 'Active', 'No'),
(1017, 'bstine816@aol.com', '', '2020-12-02 00:41:27', '2020-12-02 00:41:27', 'Active', 'No'),
(1018, 'rook110@yahoo.com', '', '2020-12-02 00:56:53', '2020-12-02 00:56:53', 'Active', 'No'),
(1019, 'dhelweg90@yahoo.com', '', '2020-12-02 01:12:14', '2020-12-02 01:12:14', 'Active', 'No'),
(1020, 'martin@fotosold.com', '', '2020-12-02 01:38:00', '2020-12-02 01:38:00', 'Active', 'No'),
(1021, 'hereskaysplace@yahoo.com', '', '2020-12-02 02:56:04', '2020-12-02 02:56:04', 'Active', 'No'),
(1022, 'hereskaysplace@yahoo.com', '', '2020-12-02 02:56:05', '2020-12-02 02:56:05', 'Active', 'No'),
(1023, 'kookumj@hotmail.com', '', '2020-12-02 04:24:42', '2020-12-02 04:24:42', 'Active', 'No'),
(1024, 'neenee58@verizon.net', '', '2020-12-02 04:35:38', '2020-12-02 04:35:38', 'Active', 'No'),
(1025, 'neenee58@verizon.net', '', '2020-12-02 04:35:48', '2020-12-02 04:35:48', 'Active', 'No'),
(1026, 'davidzyla@msn.com', '', '2020-12-02 04:51:14', '2020-12-02 04:51:14', 'Active', 'No'),
(1027, 'cindyhuey@cox.net', '', '2020-12-02 06:07:53', '2020-12-02 06:07:53', 'Active', 'No'),
(1028, 'Kondrolina@gmail.com', '', '2020-12-02 08:24:49', '2020-12-02 08:24:49', 'Active', 'No'),
(1029, 'hieuctcth@yahoo.com', '', '2020-12-02 09:24:47', '2020-12-02 09:24:47', 'Active', 'No'),
(1030, 'BR1106@HOTMAIL.COM', '', '2020-12-02 11:30:47', '2020-12-02 11:30:47', 'Active', 'No'),
(1031, 'cminpc@aol.com', 'vdLfMzOtFykNUheB', '2020-12-02 13:16:42', '2020-12-02 13:16:42', 'Active', 'No'),
(1032, 'sherrilyng@verizon.net', 'KBWwkOVaFCAzlug', '2020-12-02 14:03:40', '2020-12-02 14:03:40', 'Active', 'No'),
(1033, 'nash.kelli@yahoo.com', 'FSTJrhnVztxpBjq', '2020-12-02 14:39:54', '2020-12-02 14:39:54', 'Active', 'No'),
(1034, 'asoltani05@yahoo.com', 'KtMwUiuymZ', '2020-12-02 15:11:30', '2020-12-02 15:11:30', 'Active', 'No'),
(1035, 'Lalit.boob@gmail.com', 'Lalit Boob', '2020-12-02 15:34:32', '2020-12-02 15:34:32', 'Active', 'No'),
(1036, 'flojo30c@yahoo.com', 'UnmaowITehOd', '2020-12-02 16:41:05', '2020-12-02 16:41:05', 'Active', 'No'),
(1037, 'benbrown09@bellsouth.net', 'lIaeSVOdy', '2020-12-02 17:11:23', '2020-12-02 17:11:23', 'Active', 'No'),
(1038, 'smhyde0406@yahoo.com', 'kcEDvebZQrdyu', '2020-12-02 17:20:05', '2020-12-02 17:20:05', 'Active', 'No'),
(1039, 'madhu_rima74@yahoo.co.in', 'madhurima', '2020-12-02 19:06:13', '2020-12-02 19:06:13', 'Active', 'No'),
(1040, 'michmerk02@verizon.net', 'htqHTFAcmdpQE', '2020-12-02 19:22:21', '2020-12-02 19:22:21', 'Active', 'No'),
(1041, 'odontungalagv@yahoo.com', '', '2020-12-02 19:38:41', '2020-12-02 19:38:41', 'Active', 'No'),
(1042, 'austinpeay2001@gmail.com', '', '2020-12-02 20:15:26', '2020-12-02 20:15:26', 'Active', 'No'),
(1043, 'rasleen59@gmail.com', 'Rasleen Dhupar', '2020-12-02 20:26:29', '2020-12-02 20:26:29', 'Active', 'No'),
(1044, 'harishpillai_78692@yahoo.com', 'Harish', '2020-12-02 20:39:21', '2020-12-02 20:39:21', 'Active', 'No'),
(1045, 'jerholen1@aol.com', 'rjTqcMxIkfYJSEXZ', '2020-12-02 20:54:33', '2020-12-02 20:54:33', 'Active', 'No'),
(1046, 'lilherrera@hotmail.com', '', '2020-12-02 22:14:21', '2020-12-02 22:14:21', 'Active', 'No'),
(1047, 'Shubhamborade8@gmail.com', 'Shubham borade', '2020-12-02 22:19:36', '2020-12-02 22:19:36', 'Active', 'No'),
(1048, 'lmrozon@sympatico.ca', '', '2020-12-02 22:34:26', '2020-12-02 22:34:26', 'Active', 'No'),
(1049, 'vaishnavivaishampayan1998@gmail.com', 'Vaishnavi Vaishampayan', '2020-12-02 22:42:40', '2020-12-02 22:42:40', 'Active', 'No');
INSERT INTO `subscription` (`id`, `email`, `name`, `created_at`, `updated_at`, `status`, `is_deleted`) VALUES
(1050, 'aachu.sweet26@gmail.com', 'Aanchal', '2020-12-02 22:47:19', '2020-12-02 22:47:19', 'Active', 'No'),
(1051, 'tderr4117@aol.com', 'moQLzWasOTb', '2020-12-02 22:54:13', '2020-12-02 22:54:13', 'Active', 'No'),
(1052, 'tabuteyn@moreheadstate.edu', '', '2020-12-02 23:26:31', '2020-12-02 23:26:31', 'Active', 'No'),
(1053, 'Beccadoogie@gmail.com', '', '2020-12-02 23:58:27', '2020-12-02 23:58:27', 'Active', 'No'),
(1054, 'bigoleary@yahoo.com', 'lsOPJxDUNIeMVHEy', '2020-12-03 00:00:57', '2020-12-03 00:00:57', 'Active', 'No'),
(1055, 'blancorojo@att.net', 'whorAsaRD', '2020-12-03 00:21:18', '2020-12-03 00:21:18', 'Active', 'No'),
(1056, 'fenwick420@yahoo.com', 'nsoTlAYk', '2020-12-03 00:38:37', '2020-12-03 00:38:37', 'Active', 'No'),
(1057, 'wesknick@gmail.com', '', '2020-12-03 00:48:54', '2020-12-03 00:48:54', 'Active', 'No'),
(1058, 'virga.antonino@gmail.com', '', '2020-12-03 00:53:03', '2020-12-03 00:53:03', 'Active', 'No'),
(1059, 'matthewrhershey@yahoo.com', 'EiRuvtya', '2020-12-03 01:02:38', '2020-12-03 01:02:38', 'Active', 'No'),
(1060, 'HARJEET@HAWKSTRANS.COM', '', '2020-12-03 01:07:23', '2020-12-03 01:07:23', 'Active', 'No'),
(1061, 'classiclespaul@gmail.com', '', '2020-12-03 01:17:51', '2020-12-03 01:17:51', 'Active', 'No'),
(1062, 'perry.lydia@ymail.com', 'DTHoaKJGhPEI', '2020-12-03 02:44:07', '2020-12-03 02:44:07', 'Active', 'No'),
(1063, 'nicolerainville@hotmail.com', '', '2020-12-03 03:09:33', '2020-12-03 03:09:33', 'Active', 'No'),
(1064, 'a.farmer@yahoo.com', 'fmAQbXcGxFoHMTd', '2020-12-03 05:13:55', '2020-12-03 05:13:55', 'Active', 'No'),
(1065, 'bancale1964@yahoo.com', 'gZlrckBvjPAeXbmL', '2020-12-03 06:10:05', '2020-12-03 06:10:05', 'Active', 'No'),
(1066, 'MELML1992@GMAIL.COM', '', '2020-12-03 07:33:24', '2020-12-03 07:33:24', 'Active', 'No'),
(1067, 'diablo3rise00@gmail.com', '', '2020-12-03 07:41:35', '2020-12-03 07:41:35', 'Active', 'No'),
(1068, 'SOUBELLE67@GMAIL.COM', '', '2020-12-03 08:03:31', '2020-12-03 08:03:31', 'Active', 'No'),
(1069, 'philipshepherd@att.net', 'QVrXdICaEswJx', '2020-12-03 08:11:05', '2020-12-03 08:11:05', 'Active', 'No'),
(1070, 'kainaatmir88@gmail.com', 'Kanchan', '2020-12-03 08:38:01', '2020-12-03 08:38:01', 'Active', 'No'),
(1071, 'giberticori@yahoo.com', 'pATHMjNBDg', '2020-12-03 08:48:41', '2020-12-03 08:48:41', 'Active', 'No'),
(1072, 'digrajinamdar@gmail.com', 'Digvijay Inamdar', '2020-12-03 10:06:02', '2020-12-03 10:06:02', 'Active', 'No'),
(1073, 'Paramjeet Singh Rajput', 'Paramjeet Rajput', '2020-12-03 10:10:30', '2020-12-03 10:10:30', 'Active', 'No'),
(1074, 'moffat_farm@yahoo.com', 'JTcDBrqVpUn', '2020-12-03 10:41:30', '2020-12-03 10:41:30', 'Active', 'No'),
(1075, 'puranik.sakshi8111@gmail.com', 'Sakshi Puranik', '2020-12-03 12:11:29', '2020-12-03 12:11:29', 'Active', 'No'),
(1076, 'tylerdonovan01052006@yahoo.com', 'UaoKwQjlNmFDXW', '2020-12-03 12:42:08', '2020-12-03 12:42:08', 'Active', 'No'),
(1077, 'magichouz007@gmail.com', 'Sara Shah', '2020-12-03 13:43:07', '2020-12-03 13:43:07', 'Active', 'No'),
(1078, 'louielulham@yahoo.com', 'RIXyefdpj', '2020-12-03 14:23:08', '2020-12-03 14:23:08', 'Active', 'No'),
(1079, 'neemasaluja@gmail.com', 'Neema saluja', '2020-12-03 20:01:55', '2020-12-03 20:01:55', 'Active', 'No'),
(1080, 'lrainey1298@verizon.net', 'NJMGSlOUehDATPH', '2020-12-03 20:48:04', '2020-12-03 20:48:04', 'Active', 'No'),
(1081, 'ray508@icloud.com', '', '2020-12-03 23:31:01', '2020-12-03 23:31:01', 'Active', 'No'),
(1082, 'dhanishtha02@icloud.com', 'Dhanishtha Lalwani', '2020-12-03 23:54:43', '2020-12-03 23:54:43', 'Active', 'No'),
(1083, 'loripreed@gmail.com', '', '2020-12-04 00:06:15', '2020-12-04 00:06:15', 'Active', 'No'),
(1084, 'jeremy@kennedyjewelry.com', '', '2020-12-04 01:14:10', '2020-12-04 01:14:10', 'Active', 'No'),
(1085, 'shizgillis@gmail.com', '', '2020-12-04 02:14:30', '2020-12-04 02:14:30', 'Active', 'No'),
(1086, 'lvd4000psi@yahoo.com', '', '2020-12-04 02:54:59', '2020-12-04 02:54:59', 'Active', 'No'),
(1087, 'rayrenner59@gmail.com', '', '2020-12-04 06:02:58', '2020-12-04 06:02:58', 'Active', 'No'),
(1088, 'DANAIAHCOOMBS95@GMAIL.COM', '', '2020-12-04 08:11:39', '2020-12-04 08:11:39', 'Active', 'No'),
(1089, 'tausifshaikh4071@gmail.com', 'Tausif shaikh', '2020-12-04 11:49:41', '2020-12-04 11:49:41', 'Active', 'No'),
(1090, 'claireabbe@aol.com', 'PXhnkvtHZ', '2020-12-04 14:24:46', '2020-12-04 14:24:46', 'Active', 'No'),
(1091, 'goldielox_38@yahoo.com', '', '2020-12-04 17:46:20', '2020-12-04 17:46:20', 'Active', 'No'),
(1092, 'kimmiemc@twc.com', '', '2020-12-04 17:54:23', '2020-12-04 17:54:23', 'Active', 'No'),
(1093, 'bduncanatc@yahoo.com', '', '2020-12-04 18:20:40', '2020-12-04 18:20:40', 'Active', 'No'),
(1094, 'nomeld@live.com', '', '2020-12-04 19:37:14', '2020-12-04 19:37:14', 'Active', 'No'),
(1095, 'ecomwoman@yahoo.com', '', '2020-12-04 20:13:10', '2020-12-04 20:13:10', 'Active', 'No'),
(1096, 'RGSON@MSN.COM', '', '2020-12-04 22:23:50', '2020-12-04 22:23:50', 'Active', 'No'),
(1097, 'emilyevanich@gmail.com', '', '2020-12-05 00:04:13', '2020-12-05 00:04:13', 'Active', 'No'),
(1098, 'Hopson.tyrone@gmail.com', '', '2020-12-05 01:20:49', '2020-12-05 01:20:49', 'Active', 'No'),
(1099, 'genieconstruction@gmail.com', '', '2020-12-05 01:54:03', '2020-12-05 01:54:03', 'Active', 'No'),
(1100, 'Mgymrat@aol.com', '', '2020-12-05 03:16:25', '2020-12-05 03:16:25', 'Active', 'No'),
(1101, 'maryanngvillegas@gmail.com', '', '2020-12-05 03:17:45', '2020-12-05 03:17:45', 'Active', 'No'),
(1102, 'gonzalezelba702@gmail.com', '', '2020-12-05 04:50:03', '2020-12-05 04:50:03', 'Active', 'No'),
(1103, 'Jennifermurray54@gmail.com', '', '2020-12-05 04:53:05', '2020-12-05 04:53:05', 'Active', 'No'),
(1104, 'csernwv67@aol.com', '', '2020-12-05 05:18:06', '2020-12-05 05:18:06', 'Active', 'No'),
(1105, 'steve@psfp.com', '', '2020-12-05 08:12:30', '2020-12-05 08:12:30', 'Active', 'No'),
(1106, 'c.sgherza@hotmail.com', '', '2020-12-05 14:13:09', '2020-12-05 14:13:09', 'Active', 'No'),
(1107, 'danny.garrison@comcast.net', '', '2020-12-05 14:23:11', '2020-12-05 14:23:11', 'Active', 'No'),
(1108, 'bdanels@gmail.com', '', '2020-12-05 15:43:32', '2020-12-05 15:43:32', 'Active', 'No'),
(1109, 'vanefer1980@live.com', '', '2020-12-05 19:51:17', '2020-12-05 19:51:17', 'Active', 'No'),
(1110, 'Psmith3623@gmail.com', '', '2020-12-05 22:48:58', '2020-12-05 22:48:58', 'Active', 'No'),
(1111, 'allen.mark.r@gmail.com', '', '2020-12-06 00:25:29', '2020-12-06 00:25:29', 'Active', 'No'),
(1112, 'Aweather310@gmail.com', '', '2020-12-06 02:45:15', '2020-12-06 02:45:15', 'Active', 'No'),
(1113, '2012mukhlis@gmail.com', '', '2020-12-06 04:33:49', '2020-12-06 04:33:49', 'Active', 'No'),
(1114, 'amoorepercussion@yahoo.com', '', '2020-12-06 16:53:55', '2020-12-06 16:53:55', 'Active', 'No'),
(1115, 'shermans4728@aol.com', 'jyxLsqgcaf', '2020-12-06 18:16:20', '2020-12-06 18:16:20', 'Active', 'No'),
(1116, 'conshamyoov@gmail.com', 'mXYDshRwOx', '2020-12-06 23:09:46', '2020-12-06 23:09:46', 'Active', 'No'),
(1117, 'athar.abbas@hotmail.com', '', '2020-12-07 02:00:33', '2020-12-07 02:00:33', 'Active', 'No'),
(1118, 'wildhuckleberry@msn.com', '', '2020-12-07 08:01:31', '2020-12-07 08:01:31', 'Active', 'No'),
(1119, 'kearneyank3@gmail.com', '', '2020-12-07 09:02:34', '2020-12-07 09:02:34', 'Active', 'No'),
(1120, 'joellee1@hotmail.co.uk', '', '2020-12-07 16:33:46', '2020-12-07 16:33:46', 'Active', 'No'),
(1121, 'emerita.levesongower@yahoo.com', 'UlknKZEIJqdjw', '2020-12-07 19:00:51', '2020-12-07 19:00:51', 'Active', 'No'),
(1122, 'keithf87@msn.com', '', '2020-12-07 23:50:16', '2020-12-07 23:50:16', 'Active', 'No'),
(1123, 'titan88132@gmail.com', '', '2020-12-08 01:06:12', '2020-12-08 01:06:12', 'Active', 'No'),
(1124, 'sahownee@yahoo.com', '', '2020-12-08 01:13:03', '2020-12-08 01:13:03', 'Active', 'No'),
(1125, 'browne_shawnta@yahoo.com', 'zCwkJYUm', '2020-12-08 01:17:21', '2020-12-08 01:17:21', 'Active', 'No'),
(1126, 'edubuisson02@gmail.com', '', '2020-12-08 01:47:01', '2020-12-08 01:47:01', 'Active', 'No'),
(1127, 'tammylippa826@gmail.com', '', '2020-12-08 03:25:10', '2020-12-08 03:25:10', 'Active', 'No'),
(1128, 'caos_srbin@hotmail.com', '', '2020-12-08 03:34:56', '2020-12-08 03:34:56', 'Active', 'No'),
(1129, 'terance420877241@hotmail.com', '', '2020-12-08 03:49:09', '2020-12-08 03:49:09', 'Active', 'No'),
(1130, 'mariavillelap@gmail.com', '', '2020-12-08 04:06:28', '2020-12-08 04:06:28', 'Active', 'No'),
(1131, 'qp8878@yahoo.com', '', '2020-12-08 04:08:13', '2020-12-08 04:08:13', 'Active', 'No'),
(1132, 'grassshoppper_2000@yahoo.com', '', '2020-12-08 04:59:04', '2020-12-08 04:59:04', 'Active', 'No'),
(1133, 'kmfinn74@cs.com', '', '2020-12-08 05:06:42', '2020-12-08 05:06:42', 'Active', 'No'),
(1134, 'tavishi.sachdeva7@gmail.com', '', '2020-12-08 05:23:33', '2020-12-08 05:23:33', 'Active', 'No'),
(1135, 'jim@wcfa.net', '', '2020-12-08 05:33:09', '2020-12-08 05:33:09', 'Active', 'No'),
(1136, 'jeanebryan2@gmail.com', '', '2020-12-08 06:08:34', '2020-12-08 06:08:34', 'Active', 'No'),
(1137, 'brigidstanley@yahoo.com', 'dMlDAibrVOqBWHFJ', '2020-12-08 06:22:01', '2020-12-08 06:22:01', 'Active', 'No'),
(1138, 'weladia@yahoo.com', 'IbRjrDXyFiZCxG', '2020-12-08 06:34:19', '2020-12-08 06:34:19', 'Active', 'No'),
(1139, 'rep9534@yahoo.com', '', '2020-12-08 10:05:04', '2020-12-08 10:05:04', 'Active', 'No'),
(1140, 'kumudini0209@gmail.com', 'Kumudini Sanghani', '2020-12-08 16:49:19', '2020-12-08 16:49:19', 'Active', 'No'),
(1141, 'samrstein@comcast.net', '', '2020-12-08 21:08:43', '2020-12-08 21:08:43', 'Active', 'No'),
(1142, 'erinfitzie@gmail.com', '', '2020-12-08 22:12:23', '2020-12-08 22:12:23', 'Active', 'No'),
(1143, 'catharine.smith@bell.net', '', '2020-12-08 22:16:13', '2020-12-08 22:16:13', 'Active', 'No'),
(1144, 'troystep@gmail.com', '', '2020-12-08 22:41:27', '2020-12-08 22:41:27', 'Active', 'No'),
(1145, 'BOBBYSAZ@GMAIL.COM', '', '2020-12-08 23:02:52', '2020-12-08 23:02:52', 'Active', 'No'),
(1146, 'pnovelties@gmail.com', '', '2020-12-09 01:52:27', '2020-12-09 01:52:27', 'Active', 'No'),
(1147, 'info@dougjtaylor.com', '', '2020-12-09 02:28:01', '2020-12-09 02:28:01', 'Active', 'No'),
(1148, 'othercannon@gmail.com', '', '2020-12-09 05:57:06', '2020-12-09 05:57:06', 'Active', 'No'),
(1149, 'shaundaclemy@yahoo.com', 'pICoAuMVdNixlm', '2020-12-09 07:39:30', '2020-12-09 07:39:30', 'Active', 'No'),
(1150, 'rjgallerge@aol.com', '', '2020-12-09 07:44:46', '2020-12-09 07:44:46', 'Active', 'No'),
(1151, 'rbthrower@yahoo.com', '', '2020-12-09 11:14:18', '2020-12-09 11:14:18', 'Active', 'No'),
(1152, 'clara.gleeson@cantab.net', '', '2020-12-09 14:30:09', '2020-12-09 14:30:09', 'Active', 'No'),
(1153, 'Plmkrazy1962@yahoo.com', '', '2020-12-09 15:12:23', '2020-12-09 15:12:23', 'Active', 'No'),
(1154, 'gquezada210@gmail.com', '', '2020-12-09 17:42:58', '2020-12-09 17:42:58', 'Active', 'No'),
(1155, 'michaeldillon@rocketmail.com', '', '2020-12-09 17:45:26', '2020-12-09 17:45:26', 'Active', 'No'),
(1156, 'rmacdow477@aol.com', '', '2020-12-09 18:07:48', '2020-12-09 18:07:48', 'Active', 'No'),
(1157, 'romanjason@msn.com', '', '2020-12-09 21:37:31', '2020-12-09 21:37:31', 'Active', 'No'),
(1158, 'mnavy004@hotmail.com', '', '2020-12-09 21:58:44', '2020-12-09 21:58:44', 'Active', 'No'),
(1159, 'marisela_francisco@hotmail.com', '', '2020-12-09 23:44:27', '2020-12-09 23:44:27', 'Active', 'No'),
(1160, 'nicole.liu@aventislaw.com', '', '2020-12-10 01:43:39', '2020-12-10 01:43:39', 'Active', 'No'),
(1161, 'andscott@email.com', '', '2020-12-10 03:07:55', '2020-12-10 03:07:55', 'Active', 'No'),
(1162, 'della.lowe@dallascityhall.com', '', '2020-12-10 04:30:36', '2020-12-10 04:30:36', 'Active', 'No'),
(1163, 'saadbelfquih@gmail.com', '', '2020-12-10 07:56:38', '2020-12-10 07:56:38', 'Active', 'No'),
(1164, 'llawson523@yahoo.com', '', '2020-12-10 12:04:00', '2020-12-10 12:04:00', 'Active', 'No'),
(1165, 'simonesteele390@yahoo.com', 'uvfrNIhOg', '2020-12-10 15:37:12', '2020-12-10 15:37:12', 'Active', 'No'),
(1166, 'Gupta.Vimal20@gmail.com', 'Vimalkumar Gupta', '2020-12-10 18:09:37', '2020-12-10 18:09:37', 'Active', 'No'),
(1167, 'ajsinegar@gmail.com', '', '2020-12-10 19:23:06', '2020-12-10 19:23:06', 'Active', 'No'),
(1168, 'ionwuegbusi@gmail.com', '', '2020-12-10 20:51:31', '2020-12-10 20:51:31', 'Active', 'No'),
(1169, 'mshields72@yahoo.com', '', '2020-12-10 23:11:27', '2020-12-10 23:11:27', 'Active', 'No'),
(1170, 'jason_wildbur@hotmail.com', '', '2020-12-11 00:01:17', '2020-12-11 00:01:17', 'Active', 'No'),
(1171, 'mikarodin@hotmail.com', '', '2020-12-11 00:32:55', '2020-12-11 00:32:55', 'Active', 'No'),
(1172, 'daveb@nayax.com', '', '2020-12-11 02:28:57', '2020-12-11 02:28:57', 'Active', 'No'),
(1173, 'cjudygo@hotmail.com', '', '2020-12-11 06:22:24', '2020-12-11 06:22:24', 'Active', 'No'),
(1174, 'Nicci.Kirchoff@LutherAuto.com', '', '2020-12-11 07:02:39', '2020-12-11 07:02:39', 'Active', 'No'),
(1175, 'bob@draytoncatering.com', '', '2020-12-11 11:23:54', '2020-12-11 11:23:54', 'Active', 'No'),
(1176, 'Gtrrz_ntl@yahoo.com', '', '2020-12-11 12:45:49', '2020-12-11 12:45:49', 'Active', 'No'),
(1177, 'cforee@afamilylegacy.com', '', '2020-12-11 12:48:33', '2020-12-11 12:48:33', 'Active', 'No'),
(1178, 'jgator@sbcglobal.net', '', '2020-12-11 13:05:55', '2020-12-11 13:05:55', 'Active', 'No'),
(1179, 'RICHARDGP59@MSN.COM', '', '2020-12-11 14:25:18', '2020-12-11 14:25:18', 'Active', 'No'),
(1180, 'Sebastian@thechristmaslightpros.com', '', '2020-12-11 17:12:27', '2020-12-11 17:12:27', 'Active', 'No'),
(1181, 'mikeski14@verizon.net', '', '2020-12-11 20:36:04', '2020-12-11 20:36:04', 'Active', 'No'),
(1182, 'HOYTF@MAC.COM', '', '2020-12-11 21:20:01', '2020-12-11 21:20:01', 'Active', 'No'),
(1183, 'elisifkq@gmail.com', '', '2020-12-11 21:38:42', '2020-12-11 21:38:42', 'Active', 'No'),
(1184, 'arpita.singh1391@gmail.com', '', '2020-12-11 22:58:45', '2020-12-11 22:58:45', 'Active', 'No'),
(1185, 'mzparkercampbell@gmail.com', '', '2020-12-12 02:44:07', '2020-12-12 02:44:07', 'Active', 'No'),
(1186, 'meredithdeanx3@gmail.com', '', '2020-12-12 02:45:39', '2020-12-12 02:45:39', 'Active', 'No'),
(1187, 'JSEIFFERLEIN@IPALIVING.COM', '', '2020-12-12 03:45:45', '2020-12-12 03:45:45', 'Active', 'No'),
(1188, 'Michelelabrucherie@gmail.com', '', '2020-12-12 03:54:08', '2020-12-12 03:54:08', 'Active', 'No'),
(1189, 'Elaine.ward@virtamed.com', '', '2020-12-12 04:19:16', '2020-12-12 04:19:16', 'Active', 'No'),
(1190, 'dorawalker79@aol.com', '', '2020-12-12 17:35:33', '2020-12-12 17:35:33', 'Active', 'No'),
(1191, 'hkalback@aol.com', '', '2020-12-12 21:22:39', '2020-12-12 21:22:39', 'Active', 'No'),
(1192, 'mbwheeler1919@gmail.com', '', '2020-12-13 02:14:19', '2020-12-13 02:14:19', 'Active', 'No'),
(1193, 'laurajones806@btinternet.com', '', '2020-12-13 16:09:52', '2020-12-13 16:09:52', 'Active', 'No'),
(1194, 'merriweathers_743@msn.com', '', '2020-12-13 19:24:26', '2020-12-13 19:24:26', 'Active', 'No'),
(1195, 'carmotionmovie@gmail.com', '', '2020-12-14 02:21:31', '2020-12-14 02:21:31', 'Active', 'No'),
(1196, 'drmurryiii@gmail.com', '', '2020-12-14 02:41:57', '2020-12-14 02:41:57', 'Active', 'No'),
(1197, 'john.dyckhoff@farmiq.co.nz', '', '2020-12-14 04:58:02', '2020-12-14 04:58:02', 'Active', 'No'),
(1198, 'grundy@tamaki.ac.nz', '', '2020-12-14 07:15:03', '2020-12-14 07:15:03', 'Active', 'No'),
(1199, 'engineer@anago.co.nz', '', '2020-12-14 07:32:50', '2020-12-14 07:32:50', 'Active', 'No'),
(1200, 's.burt@ucol.ac.nz', '', '2020-12-14 07:44:35', '2020-12-14 07:44:35', 'Active', 'No'),
(1201, 'judit_re@yahoo.es', '', '2020-12-14 13:15:15', '2020-12-14 13:15:15', 'Active', 'No'),
(1202, 'flemingfay9@gmail.com', 'OdqGRywC', '2020-12-14 16:04:38', '2020-12-14 16:04:38', 'Active', 'No'),
(1203, 'anjaballantyne@yahoo.com', 'tFvgEjrYdxGnLql', '2020-12-14 18:28:27', '2020-12-14 18:28:27', 'Active', 'No'),
(1204, 'kaydora232@yahoo.com', 'ayqiXxZVntPHlDK', '2020-12-14 19:08:21', '2020-12-14 19:08:21', 'Active', 'No'),
(1205, 'd.tweddle@ntlworld.com', '', '2020-12-14 21:40:44', '2020-12-14 21:40:44', 'Active', 'No'),
(1206, 'marisa@citylifelansing.com', '', '2020-12-15 00:34:31', '2020-12-15 00:34:31', 'Active', 'No'),
(1207, 'axkara01@gmail.com', '', '2020-12-15 04:16:39', '2020-12-15 04:16:39', 'Active', 'No'),
(1208, 'rlgatti@yahoo.com', '', '2020-12-15 04:58:38', '2020-12-15 04:58:38', 'Active', 'No'),
(1209, 'rell.lafargue@gmail.com', '', '2020-12-15 05:01:22', '2020-12-15 05:01:22', 'Active', 'No'),
(1210, 'Lizzie@mr-mower.com', '', '2020-12-15 07:08:46', '2020-12-15 07:08:46', 'Active', 'No'),
(1211, 'MAIL@BEAUDRYCABS.COM', '', '2020-12-15 08:00:49', '2020-12-15 08:00:49', 'Active', 'No'),
(1212, 'SKDONOHO@GMAIL.COM', '', '2020-12-15 08:30:42', '2020-12-15 08:30:42', 'Active', 'No');

-- --------------------------------------------------------

--
-- Table structure for table `subscription2`
--

CREATE TABLE `subscription2` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` enum('Active','Inactive') NOT NULL,
  `is_deleted` enum('No','Yes') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subscription2`
--

INSERT INTO `subscription2` (`id`, `email`, `created_at`, `updated_at`, `status`, `is_deleted`) VALUES
(1, 'pagarelaxmi@gmail.com', '2020-09-05 16:25:57', '2020-09-05 16:25:57', 'Active', 'No'),
(3, 'laxmipagare99@gmail.com', '2020-10-26 16:41:09', '2020-10-27 16:41:09', 'Active', 'No');

-- --------------------------------------------------------

--
-- Table structure for table `survey`
--

CREATE TABLE `survey` (
  `id` int(11) NOT NULL,
  `download_app` varchar(50) NOT NULL,
  `comments` text NOT NULL,
  `refrains` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` enum('Active','Inactive') NOT NULL,
  `is_deleted` enum('No','Yes') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `survey`
--

INSERT INTO `survey` (`id`, `download_app`, `comments`, `refrains`, `created_at`, `updated_at`, `status`, `is_deleted`) VALUES
(1, 'Yes', 'The most important feature you look in a nutrition app?', '', '2020-09-03 05:26:22', '2020-09-03 05:26:22', 'Active', 'No'),
(7, 'Yes', '', 'adadad', '2020-09-04 16:22:21', '2020-09-04 16:22:21', 'Active', 'No'),
(8, 'No', '', 'asdasdasd', '2020-09-04 16:22:39', '2020-09-04 16:22:39', 'Active', 'No'),
(9, 'No', '', 'adadasd', '2020-09-04 16:24:34', '2020-09-04 16:24:34', 'Active', 'No'),
(10, 'Yes', '', 'What refrains you', '2020-09-05 16:25:38', '2020-09-05 16:25:38', 'Active', 'No'),
(11, 'No', '', 'What refrains you from using a nutrition app?', '2020-09-05 16:40:42', '2020-09-05 16:40:42', 'Active', 'No'),
(12, 'Yes', '', 'eef', '2020-09-05 17:05:24', '2020-09-05 17:05:24', 'Active', 'No'),
(13, 'Yes', '', 'abc', '2020-09-05 19:19:25', '2020-09-05 19:19:25', 'Active', 'No'),
(14, 'Yes', 'abc', '', '2020-09-05 19:19:53', '2020-09-05 19:19:53', 'Active', 'No'),
(15, 'Yes', '', '', '2020-09-05 23:29:45', '2020-09-05 23:29:45', 'Active', 'No'),
(16, 'Yes', 'abc', '', '2020-09-05 23:30:42', '2020-09-05 23:30:42', 'Active', 'No'),
(17, 'Yes', 'abc', '', '2020-09-07 11:05:38', '2020-09-07 11:05:38', 'Active', 'No'),
(18, 'No', '', 'abc', '2020-09-07 11:05:53', '2020-09-07 11:05:53', 'Active', 'No'),
(19, 'Yes', '', '', '2020-09-07 16:53:40', '2020-09-07 16:53:40', 'Active', 'No'),
(20, 'Yes', '', '', '2020-09-07 16:53:45', '2020-09-07 16:53:45', 'Active', 'No'),
(21, 'Yes', '', '', '2020-09-07 16:53:55', '2020-09-07 16:53:55', 'Active', 'No'),
(22, 'Yes', '', '', '2020-09-07 16:54:08', '2020-09-07 16:54:08', 'Active', 'No'),
(23, 'Yes', '', '', '2020-09-07 16:54:23', '2020-09-07 16:54:23', 'Active', 'No'),
(24, 'Yes', '', '', '2020-09-07 16:55:34', '2020-09-07 16:55:34', 'Active', 'No'),
(25, 'Yes', '', '', '2020-09-07 16:56:22', '2020-09-07 16:56:22', 'Active', 'No'),
(26, 'Yes', '', '', '2020-09-07 16:56:31', '2020-09-07 16:56:31', 'Active', 'No'),
(27, 'No', '', '', '2020-09-07 16:58:46', '2020-09-07 16:58:46', 'Active', 'No'),
(28, 'Yes', 'asdfasfasf', '', '2020-09-07 16:58:58', '2020-09-07 16:58:58', 'Active', 'No'),
(29, 'Yes', '', '', '2020-09-07 18:15:27', '2020-09-07 18:15:27', 'Active', 'No'),
(30, 'Yes', '', '', '2020-09-07 18:16:18', '2020-09-07 18:16:18', 'Active', 'No'),
(31, 'Yes', 'abc', '', '2020-09-09 15:55:31', '2020-09-09 15:55:31', 'Active', 'No'),
(32, 'No', '', 'bcc', '2020-09-09 15:55:42', '2020-09-09 15:55:42', 'Active', 'No'),
(33, 'Yes', '', 'Zfdgrgr grgrgr grhgrhr', '2020-09-09 19:14:00', '2020-09-09 19:14:00', 'Active', 'No'),
(36, 'Yes', '', '', '2020-09-10 18:08:07', '2020-09-10 18:08:07', 'Active', 'No'),
(37, 'Yes', 'height', '', '2020-09-12 00:40:24', '2020-09-12 00:40:24', 'Active', 'No'),
(38, 'Yes', '', '', '2020-09-12 20:44:15', '2020-09-12 20:44:15', 'Active', 'No'),
(39, 'Yes', '', 'Gооd dаy!  nutridock.com \r\n \r\nDid yоu knоw thаt it is pоssiblе tо sеnd rеquеst   lеgаl? \r\nWе оffеr а nеw lеgаl mеthоd оf sеnding mеssаgе thrоugh соntасt fоrms. Suсh fоrms аrе lосаtеd оn mаny sitеs. \r\nWhеn suсh аppеаl аrе sеnt, nо pеrsоnаl dаtа is usеd, аnd mеssаgеs аrе sеnt tо fоrms spесifiсаlly dеsignеd tо rесеivе mеssаgеs аnd аppеаls. \r\nаlsо, mеssаgеs sеnt thrоugh соmmuniсаtiоn Fоrms dо nоt gеt intо spаm bесаusе suсh mеssаgеs аrе соnsidеrеd impоrtаnt. \r\nWе оffеr yоu tо tеst оur sеrviсе fоr frее. Wе will sеnd up tо 50,000 mеssаgеs fоr yоu. \r\nThе соst оf sеnding оnе milliоn mеssаgеs is 49 USD. \r\n \r\nThis оffеr is сrеаtеd аutоmаtiсаlly. Plеаsе usе thе соntасt dеtаils bеlоw tо соntасt us. \r\n \r\nContact us. \r\nTelegram - @FeedbackMessages \r\nSkype  live:contactform_18 \r\nWhatsApp - +375259112693', '2020-09-13 02:23:36', '2020-09-13 02:23:36', 'Active', 'No'),
(40, 'Yes', 'How to reduce stress and be confident', '', '2020-09-13 09:07:00', '2020-09-13 09:07:00', 'Active', 'No'),
(41, 'Yes', 'Nice', '', '2020-09-13 15:31:30', '2020-09-13 15:31:30', 'Active', 'No'),
(42, 'Yes', 'Diet', '', '2020-09-14 07:23:09', '2020-09-14 07:23:09', 'Active', 'No'),
(43, 'Yes', 'Energy', '', '2020-09-14 11:34:03', '2020-09-14 11:34:03', 'Active', 'No'),
(44, 'Yes', '', '', '2020-09-14 14:15:23', '2020-09-14 14:15:23', 'Active', 'No'),
(45, 'Yes', '', '', '2020-09-14 16:29:16', '2020-09-14 16:29:16', 'Active', 'No'),
(46, 'No', '', '', '2020-09-15 20:19:49', '2020-09-15 20:19:49', 'Active', 'No'),
(47, 'Yes', '', 'Nvdfjhdficj efiuwdiwrhfduehfjei kfksdjaksdhsjfhwkjf https://mail.ru/?ddjfsjfuwfw', '2020-09-16 23:06:01', '2020-09-16 23:06:01', 'Active', 'No'),
(48, 'Yes', '', '', '2020-09-17 23:22:52', '2020-09-17 23:22:52', 'Active', 'No'),
(49, 'No', '', 'Not all indian food items present', '2020-09-18 05:45:03', '2020-09-18 05:45:03', 'Active', 'No'),
(50, 'Yes', '', 'ICH HАBЕ GЕRАDE UM ЕINЕ WEITERE AUSZAHLUNG VON 7.415 EUR GEBЕTЕN. \r\nhttps://8523658euro.page.link/79tV \r\nICH KАNN ES KAUM ERWАRTEN, ЕS MIT MEINЕR FRЕUNDIN ZU VERBRINGЕN. \r\nNEHME IСH SIE ZUM ABENDESSЕN MIT? \r\nODЕR NЕHMEN WIR UNS EINEN TAG FREI UND GЕHEN IN EIN SСHONЕS HОTЕL АUF DEM LAND? \r\nhttps://352658euro.page.link/wJfG \r\nIСH HATTЕ NIE GЕDАCHT, DАSS IСH SO ЕIN DILEMMА HABЕN WURDE https://8569euro.page.link/Mi2H ABER ЕS MАCHT MIR NICHTS AUS!', '2020-09-18 08:25:21', '2020-09-18 08:25:21', 'Active', 'No'),
(51, 'Yes', 'Prevent diseases', '', '2020-09-18 19:34:16', '2020-09-18 19:34:16', 'Active', 'No'),
(52, 'Yes', 'Physical wellbeing', '', '2020-09-19 09:41:44', '2020-09-19 09:41:44', 'Active', 'No'),
(53, 'Yes', 'Guidance for food good for brain and joint health', '', '2020-09-19 13:01:18', '2020-09-19 13:01:18', 'Active', 'No'),
(54, 'Yes', '', '', '2020-09-19 17:41:58', '2020-09-19 17:41:58', 'Active', 'No'),
(55, 'Yes', '', 'Нi mаchо! I wish уou would рull mе thrоugh all thе holes: https://slimex365.com/3ac82', '2020-09-20 19:11:31', '2020-09-20 19:11:31', 'Active', 'No'),
(56, 'Yes', '', '<a href=http://skoperations.site/q_demo_account.php>New search engine. - 1000 000$ </a> \r\n \r\nInvestors only need expend spread between ask/bid low price. People have made good money when they quit, as soon as the bull run was in internet peak. The numbers of goals associated with investing in stocks. \r\n \r\n<a href=\"http://skoperations.site/q_demo_account.php\"> 1000 000</a> \r\n \r\n \r\nIf must know how you can invest money or in order to invest for 2011 and beyond and you\'re simply on a good budget, this particular blog post is written for everyone. Some of the biggest and best fund companies in society got that way by working with small investors directly. If you ever likely adjust in 2011 and starting the forthcoming. Today the internet makes it easier to invest money than ever before.', '2020-09-25 03:03:06', '2020-09-25 03:03:06', 'Active', 'No'),
(57, 'Yes', '', 'Hi there \r\n \r\nIf you want to get ahead of your competition, have a higher Domain Authority score. Its just simple as that. \r\nWith our service you get Domain Authority above 50 points in just 30 days. \r\n \r\nThis service is guaranteed \r\n \r\nFor more information, check our service here \r\nhttps://www.monkeydigital.co/Get-Guaranteed-Domain-Authority-50/ \r\n \r\nN E W : \r\nDA60 is now available here \r\nhttps://www.monkeydigital.co/product/moz-da60-seo-plan/ \r\n \r\n \r\nthank you \r\nMike Ralphs\r\n \r\nMonkey Digital \r\nsupport@monkeydigital.co', '2020-09-29 22:38:17', '2020-09-29 22:38:17', 'Active', 'No'),
(58, 'Yes', '', 'Hi there \r\nI have just checked nutridock.com for the ranking keywords and seen that your SEO metrics could use a boost. \r\n \r\nWe will improve your SEO metrics and ranks organically and safely, using only whitehat methods, while providing monthly reports and outstanding support. \r\n \r\nPlease check our pricelist here, we offer SEO at cheap rates. \r\nhttps://www.hilkom-digital.de/cheap-seo-packages/ \r\n \r\nStart increasing your sales and leads with us, today! \r\n \r\nregards \r\nHilkom Digital Team \r\nsupport@hilkom-digital.de', '2020-10-01 23:54:13', '2020-10-01 23:54:13', 'Active', 'No'),
(59, 'Yes', '', 'Hey there, I just found your site, quick question…\r\n\r\nMy name’s Eric, I found nutridock.com after doing a quick search – you showed up near the top of the rankings, so whatever you’re doing for SEO, looks like it’s working well.\r\n\r\nSo here’s my question – what happens AFTER someone lands on your site?  Anything?\r\n\r\nResearch tells us at least 70% of the people who find your site, after a quick once-over, they disappear… forever.\r\n\r\nThat means that all the work and effort you put into getting them to show up, goes down the tubes.\r\n\r\nWhy would you want all that good work – and the great site you’ve built – go to waste?\r\n\r\nBecause the odds are they’ll just skip over calling or even grabbing their phone, leaving you high and dry.\r\n\r\nBut here’s a thought… what if you could make it super-simple for someone to raise their hand, say, “okay, let’s talk” without requiring them to even pull their cell phone from their pocket?\r\n  \r\nYou can – thanks to revolutionary new software that can literally make that first call happen NOW.\r\n\r\nTalk With Web Visitor is a software widget that sits on your site, ready and waiting to capture any visitor’s Name, Email address and Phone Number.  It lets you know IMMEDIATELY – so that you can talk to that lead while they’re still there at your site.\r\n  \r\nYou know, strike when the iron’s hot!\r\n\r\nCLICK HERE http://www.talkwithwebvisitors.com to try out a Live Demo with Talk With Web Visitor now to see exactly how it works.\r\n\r\nWhen targeting leads, you HAVE to act fast – the difference between contacting someone within 5 minutes versus 30 minutes later is huge – like 100 times better!\r\n\r\nThat’s why you should check out our new SMS Text With Lead feature as well… once you’ve captured the phone number of the website visitor, you can automatically kick off a text message (SMS) conversation with them. \r\n \r\nImagine how powerful this could be – even if they don’t take you up on your offer immediately, you can stay in touch with them using text messages to make new offers, provide links to great content, and build your credibility.\r\n\r\nJust this alone could be a game changer to make your website even more effective.\r\n\r\nStrike when  the iron’s hot!\r\n\r\nCLICK HERE http://www.talkwithwebvisitors.com to learn more about everything Talk With Web Visitor can do for your business – you’ll be amazed.\r\n\r\nThanks and keep up the great work!\r\n\r\nEric\r\nPS: Talk With Web Visitor offers a FREE 14 days trial – you could be converting up to 100x more leads immediately!   \r\nIt even includes International Long Distance Calling. \r\nStop wasting money chasing eyeballs that don’t turn into paying customers. \r\nCLICK HERE http://www.talkwithwebvisitors.com to try Talk With Web Visitor now.\r\n\r\nIf you\'d like to unsubscribe click here http://talkwithwebvisitors.com/unsubscribe.aspx?d=nutridock.com', '2020-10-02 08:19:56', '2020-10-02 08:19:56', 'Active', 'No'),
(60, 'Yes', 'Consistent', '', '2020-10-05 13:13:26', '2020-10-05 13:13:26', 'Active', 'No'),
(61, 'Yes', '', 'Mediamatic helps to organize the WordPress Media Library into folders hierarchy easily using drag&drop interface.Manage thousands of media files and folders in your WordPress media library swiftly and smoothly! \r\nhttps://wordpress.org/plugins/mediamatic/', '2020-10-06 05:27:11', '2020-10-06 05:27:11', 'Active', 'No'),
(62, 'Yes', '', 'Gооd dаy! \r\nI have just checked nutridock.com for the ranking keywords and seen that your SEO metrics could use a boost. \r\n \r\nWe will improve your SEO metrics and ranks organically and safely, using only whitehat methods, while providing monthly reports and outstanding support. \r\n \r\nPlease check our pricelist here, we offer SEO at cheap rates. \r\nhttps://www.hilkom-digital.de/cheap-seo-packages/ \r\n \r\nStart increasing your sales and leads with us, today! \r\n \r\nregards \r\nHilkom Digital Team \r\nsupport@hilkom-digital.de', '2020-10-07 20:58:32', '2020-10-07 20:58:32', 'Active', 'No'),
(63, 'Yes', '', 'ATT: nutridock.com / Nutridock SITE SOLUTIONS\r\nThis notice ENDS ON: Oct 08, 2020\r\n\r\n\r\nWe have actually not gotten a settlement from you.\r\nWe  have actually attempted to contact you however were not able to contact you.\r\n\r\n\r\nKindly Go To: https://bit.ly/2HWaOyL .\r\n\r\nFor details and also to process a discretionary settlement for solutions.\r\n\r\n\r\n\r\n10082020132752.', '2020-10-08 23:24:57', '2020-10-08 23:24:57', 'Active', 'No'),
(64, 'Yes', '', '', '2020-10-12 15:15:23', '2020-10-12 15:15:23', 'Active', 'No'),
(65, 'Yes', '', 'Hey nutridock.com, \r\n \r\nCan I get you on the horn to discuss relaunching marketing? \r\n \r\nGet started on a conversion focused landing page, an automated Linkedin marketing tool, or add explainer videos to your marketing portfolio and boost your ROI. \r\n \r\nWe also provide graphic design and call center services to handle all those new leads you\'ll be getting. \r\n \r\n \r\nd.stills@starkwoodmarketing.com \r\n \r\nMy website is http://StarkwoodMarketing.com', '2020-10-12 17:41:27', '2020-10-12 17:41:27', 'Active', 'No'),
(66, 'Yes', '', 'HOW MUCH MORE SUCCESS AND INCOME COULD YOU BRING INTO YOUR LIFE IF YOU WERE TO LEARN THE SKILLS BELOW ? \r\n \r\nWatch the Official Trailer : https://youtu.be/hb7qJmAIb9M \r\n \r\nUse this link below to Download your E-book copy Now! (50%off! )@ https://www.tonydeoleo.com \r\n \r\nOr visit Amazon \r\nAmazon :https://www.amazon.com/gp/aw/d/B08CG7DYKX/ref=tmm_kin_title_0?ie=UTF8&qid=&sr= \r\n \r\nTHE ART OF DEALING: Becoming a mastercasino dealer. https://www.amazon.com/dp/B08KYKG9MT/ref=cm_sw_r_wa_awdb_t1_KknGFbA7N0C1C.', '2020-10-13 00:18:12', '2020-10-13 00:18:12', 'Active', 'No'),
(67, 'Yes', '', '', '2020-10-13 16:41:10', '2020-10-13 16:41:10', 'Active', 'No'),
(68, 'Yes', '', 'Hello! \r\n \r\nYou\'ve been hacked! \r\n \r\nNow we have all the information about you and your accounts: \r\n \r\n+ all your logins and passwords from all accounts in payment systems, social. networks, e-mail, messengers and other services (cookies from all your browsers, i.e. access without a login and password to any of your accounts) \r\n \r\n+ history of all your correspondence by e-mail, messengers and social. networks \r\n \r\n+ all files from your PC (text, photo, video and audio files) \r\n \r\nChanging your username and password will not help, we will hack you again. \r\n \r\nPay a ransom of $ 250 and you can sleep peacefully without worrying that all information about you and all your accounts, files and personal correspondence will not become public and will not fall into the hands of intruders. \r\n \r\nBitcoin wallet to which you want to transfer $ 250 1MaRdde6X7SGuoCdFNL2fmgpLomdx7peGC \r\n \r\nIf you do not pay until tomorrow evening, then we will sell all this information on the darknet, there is a huge demand for such information \r\n \r\nPay $ 250 and sleep well!', '2020-10-13 18:51:34', '2020-10-13 18:51:34', 'Active', 'No'),
(69, 'Yes', '', '', '2020-10-14 10:42:36', '2020-10-14 10:42:36', 'Active', 'No'),
(70, 'Yes', '', '', '2020-10-14 11:31:00', '2020-10-14 11:31:00', 'Active', 'No'),
(71, 'Yes', '', 'Hello! \r\n \r\nYou still have not paid the requested amount of $ 250. \r\n \r\nWe found very interesting in your hacked accounts information that will cost more than $ 3000 on the darknet. \r\n \r\nWe give you one last chance. You have 7 hours to translate the requested amount. \r\n \r\nIf you don\'t care who uses your data, then you can do nothing. \r\n \r\nBitcoin wallet to which you want to transfer $ 250 1MaRdde6X7SGuoCdFNL2fmgpLomdx7peGC', '2020-10-15 09:33:18', '2020-10-15 09:33:18', 'Active', 'No'),
(72, 'Yes', '', 'My name’s Eric and I just found your site nutridock.com.\r\n\r\nIt’s got a lot going for it, but here’s an idea to make it even MORE effective.\r\n\r\nTalk With Web Visitor – CLICK HERE http://www.talkwithwebvisitors.com for a live demo now.\r\n\r\nTalk With Web Visitor is a software widget that’s works on your site, ready to capture any visitor’s Name, Email address and Phone Number.  It signals you the moment they let you know they’re interested – so that you can talk to that lead while they’re literally looking over your site.\r\n\r\nAnd once you’ve captured their phone number, with our new SMS Text With Lead feature, you can automatically start a text (SMS) conversation… and if they don’t take you up on your offer then, you can follow up with text messages for new offers, content links, even just “how you doing?” notes to build a relationship.\r\n\r\nCLICK HERE http://www.talkwithwebvisitors.com to discover what Talk With Web Visitor can do for your business.\r\n\r\nThe difference between contacting someone within 5 minutes versus a half-hour means you could be converting up to 100X more leads today!\r\n\r\nEric\r\nPS: Studies show that 70% of a site’s visitors disappear and are gone forever after just a moment. Don’t keep losing them. \r\nTalk With Web Visitor offers a FREE 14 days trial – and it even includes International Long Distance Calling. \r\nYou have customers waiting to talk with you right now… don’t keep them waiting. \r\nCLICK HERE http://www.talkwithwebvisitors.com to try Talk With Web Visitor now.\r\n\r\nIf you\'d like to unsubscribe click here http://talkwithwebvisitors.com/unsubscribe.aspx?d=nutridock.com', '2020-10-15 15:20:19', '2020-10-15 15:20:19', 'Active', 'No'),
(73, 'Yes', '', 'PASSIVES EINKOMMEN IM INTERNET VOR 9976 EURO PRO TAG - DIE BESTE INVESTITIONSMOGLICHKEIT: http://gongpo.moum.kr/xXHb', '2020-10-16 12:31:15', '2020-10-16 12:31:15', 'Active', 'No'),
(74, 'Yes', '', 'Greetings, \r\n \r\nWe are brokers linked with high profile investors who are willing to; \r\n \r\nFund any company in any current project; \r\n \r\nFund a project/Investment of any Interest or choices; \r\n \r\nThey are privately seeking means of expanding their investment portfolio. Should you find interested in engaging us for more detailed discussion to forge ahead, We will be happy to share more insights. \r\n \r\nYours Sincerely \r\n \r\nMohammed Khalid \r\nTel +971-52943-4865 \r\nWhatsaap +971-55765-2746', '2020-10-17 00:52:13', '2020-10-17 00:52:13', 'Active', 'No'),
(75, 'Yes', '', 'or sex only\r\ntry it https://hideuri.com/wp3JOk', '2020-10-17 17:45:44', '2020-10-17 17:45:44', 'Active', 'No'),
(76, 'Yes', '', 'PASSIVES EINKOMMEN ONLINE VON 5855 EUR AM TAG - IN EINEM MONAT KONNEN SIE IHREN JOB SICHER KUNDIGEN: https://gmy.su/:RXfub', '2020-10-18 12:40:47', '2020-10-18 12:40:47', 'Active', 'No'),
(77, 'Yes', '', 'PASSIVES EINKOMMEN IM INTERNET VOR 9845 EURO AM TAG - GONNEN SIE SICH FINANZIELLE FREIHEIT: https://darknesstr.com/3dsf0 \r\nPASSIVES EINKOMMEN ONLINE VOR 3966 EURO PRO TAG - IN EINEM MONAT KONNEN SIE SICH EIN TEURES AUTO KAUFEN: https://gmy.su/:c9bub \r\nPASSIVES EINKOMMEN IM INTERNET VOR 8856 EUR AM TAG - DIE BESTE INVESTITIONSMOGLICHKEIT: https://jtbtigers.com/3e7gc \r\nPASSIVES EINKOMMEN ONLINE VON 9077 EURO AM TAG - GONNEN SIE SICH FINANZIELLE FREIHEIT: http://freeurlredirect.com/3jybj \r\nPASSIVES EINKOMMEN IM INTERNET VON 5945 EURO AM TAG - SIE WERDEN ALLE IHRE KREDITE IN EINER WOCHE ZURUCKZAHLEN: https://links.wtf/t23R', '2020-10-20 06:58:25', '2020-10-20 06:58:25', 'Active', 'No'),
(78, 'Yes', '', 'Hi there,\r\n\r\nI hope you are doing well! I\'m looking to get in contact with someone in marketing or sales and figured to reach out via your website to start. My name is Sam, and I work with companies to help them add (or change) live chat software on their websites.\r\n\r\nIf you or someone on your team might be interested, we perform live weekly webinars to demo our product and encourage anyone to attend a 30-min session. Our live chat comes with a 30 day money-back guarantee, so you can fully experiment to see how it impacts sales or support interactions with your customers on nutridock.com.\r\n\r\nPlease let me know if you would like more information and I\'d be happy to share.\r\n\r\nSamantha Milan\r\nChat Service Division, Tyipe LLC\r\n500 Westover Drive, #15391\r\nSanford, NC 27330\r\n\r\nNot interested? Feel free to opt out here http://esendroute.com/remove?q=nutridock.com&i=14', '2020-10-22 01:33:59', '2020-10-22 01:33:59', 'Active', 'No'),
(79, 'Yes', '', 'Good day, \r\n\r\nMy name is Eric and unlike a lot of emails you might get, I wanted to instead provide you with a word of encouragement – Congratulations\r\n\r\nWhat for?  \r\n\r\nPart of my job is to check out websites and the work you’ve done with nutridock.com definitely stands out. \r\n\r\nIt’s clear you took building a website seriously and made a real investment of time and resources into making it top quality.\r\n\r\nThere is, however, a catch… more accurately, a question…\r\n\r\nSo when someone like me happens to find your site – maybe at the top of the search results (nice job BTW) or just through a random link, how do you know? \r\n\r\nMore importantly, how do you make a connection with that person?\r\n\r\nStudies show that 7 out of 10 visitors don’t stick around – they’re there one second and then gone with the wind.\r\n\r\nHere’s a way to create INSTANT engagement that you may not have known about… \r\n\r\nTalk With Web Traffic is a software widget that’s works on your site, ready to capture any visitor’s Name, Email address and Phone Number.  It lets you know INSTANTLY that they’re interested – so that you can talk to that lead while they’re literally checking out nutridock.com.\r\n\r\n==> https://www.talkwithwebtraffic.com to try out a Live Demo with Talk With Web Traffic now to see exactly how it works.\r\n\r\nIt could be a game-changer for your business – and it gets even better… once you’ve captured their phone number, with our new SMS Text With Lead feature, you can automatically start a text (SMS) conversation – immediately (and there’s literally a 100X difference between contacting someone within 5 minutes versus 30 minutes.)\r\n\r\nPlus then, even if you don’t close a deal right away, you can connect later on with text messages for new offers, content links, even just follow up notes to build a relationship.\r\n\r\nEverything I’ve just described is simple, easy, and effective. \r\n\r\n==> https://www.talkwithwebtraffic.com to discover what Talk With Web Traffic can do for your business.\r\n\r\nYou could be converting up to 100X more leads today!\r\n\r\nEric\r\nPS: Talk With Web Traffic offers a FREE 14 days trial – and it even includes International Long Distance Calling. \r\nYou have customers waiting to talk with you right now… don’t keep them waiting. \r\n==> https://www.talkwithwebtraffic.com to try Talk With Web Traffic now.\r\n\r\nIf you\'d like to unsubscribe click here https://talkwithwebtraffic.com/unsubscribe.aspx?d=nutridock.com', '2020-10-23 03:40:28', '2020-10-23 03:40:28', 'Active', 'No'),
(80, 'Yes', '', 'Hey, my name’s Eric and for just a second, imagine this…\r\n\r\n- Someone does a search and winds up at nutridock.com.\r\n\r\n- They hang out for a minute to check it out.  “I’m interested… but… maybe…”\r\n\r\n- And then they hit the back button and check out the other search results instead. \r\n\r\n- Bottom line – you got an eyeball, but nothing else to show for it.\r\n\r\n- There they go.\r\n\r\nThis isn’t really your fault – it happens a LOT – studies show 7 out of 10 visitors to any site disappear without leaving a trace.\r\n\r\nBut you CAN fix that.\r\n\r\nTalk With Web Traffic is a software widget that’s works on your site, ready to capture any visitor’s Name, Email address and Phone Number.  It lets you know right then and there – enabling you to call that lead while they’re literally looking over your site.\r\n\r\n==> https://www.talkwithwebtraffic.com to try out a Live Demo with Talk With Web Traffic now to see exactly how it works.\r\n\r\nTime is money when it comes to connecting with leads – the difference between contacting someone within 5 minutes versus 30 minutes later can be huge – like 100 times better!\r\n\r\nPlus, now that you have their phone number, with our new SMS Text With Lead feature you can automatically start a text (SMS) conversation… so even if you don’t close a deal then, you can follow up with text messages for new offers, content links, even just “how you doing?” notes to build a relationship.\r\n\r\nStrong stuff.\r\n\r\n==> https://www.talkwithwebtraffic.com to discover what Talk With Web Traffic can do for your business.\r\n\r\nYou could be converting up to 100X more leads today!\r\n\r\nEric\r\nPS: Talk With Web Traffic offers a FREE 14 days trial – and it even includes International Long Distance Calling. \r\nYou have customers waiting to talk with you right now… don’t keep them waiting. \r\n==> https://www.talkwithwebtraffic.com to try Talk With Web Traffic now.\r\n\r\nIf you\'d like to unsubscribe click here https://talkwithwebtraffic.com/unsubscribe.aspx?d=nutridock.com', '2020-10-23 06:28:23', '2020-10-23 06:28:23', 'Active', 'No'),
(81, 'Yes', '', 'ONLINE VERDIENEN VOR 9055 EUR AM TAG - IN EINEM MONAT KONNEN SIE SICH EIN TEURES HAUS KAUFEN: https://shorturl.ac/6tkp1', '2020-10-23 23:36:56', '2020-10-23 23:36:56', 'Active', 'No'),
(82, 'Yes', 'Nutrition information,  knowledge.', '', '2020-10-24 00:50:54', '2020-10-24 00:50:54', 'Active', 'No'),
(83, 'Yes', '', '', '2020-10-24 10:47:55', '2020-10-24 10:47:55', 'Active', 'No'),
(84, 'Yes', '', 'I noticed that you are not running Google Remarketing on your website. \r\n \r\nThe most affordable advertising is marketing to previous web viewers who didn\'t convert. \r\n \r\nRemarketing via Google & Facebook ads means tracking and engaging these \'lost\' customers. \r\nThey were on your site once and may only need a reminder of your services and business. \r\n \r\nCan I help you grab these low hanging fruits? \r\n \r\nLinda Ray \r\nEmail - linda@theremarketingguys.com \r\nWebsite - http://www.theremarketingguys.com', '2020-10-26 11:01:31', '2020-10-26 11:01:31', 'Active', 'No'),
(85, 'Yes', '', 'Black Lives Matter - Donate \r\nWhy We Need Your Support \r\nAs our ecosystem grows our financial support system must grow as well. \r\nWe need funds to continue our radically accessible commitment to providing healthy food from Black owned businesses, paid childcare at every event and having ASL interpreters at our monthly gatherings. \r\nOn average, our monthly open houses attract 3000+ people and costs us $100,000. \r\nWe need to raise $ 350,000 by November 3 to help thousands of black people in a very bad situation right now, we will be glad if you support us. \r\nFor quick payment, we use bitcoin wallets. You can transfer donation to this Bitcoin wallet - 12B6eCHqPVQeR8wyTTMoWQqNeTpxqeq7wk \r\nSecondly, we need resources to make sure we have the emotional and spiritual capacity to show up and move forward in the movement as our highest selves. \r\nSupporting the work of our healers including renting space weekly for Black people to process racial stress through group discussion, dance, and visual art and \r\naffirming our humanity & love for each other by starting our week with joy via #BlackJoySunday (all while creating accessibility by offering free childcare) \r\nis essential in sustaining our well-being and activism. Our weekly healing spaces cost on average $30,150/month. \r\nWe need to raise $ 350,000 by November 3 to help thousands of black people in a very bad situation right now, we will be glad if you support us. \r\nFor quick payment, we use bitcoin wallets. You can transfer donation to this Bitcoin wallet - 12B6eCHqPVQeR8wyTTMoWQqNeTpxqeq7wk \r\nLastly and most importantly, we need funds to support the emerging leadership of our ecosystem move through the world. \r\nAs Black people in a city facing the ravages of displacement and economic disinvestment, it’s difficult to do the work of liberating your community while figuring out how to pay rent and feed yourself. \r\nWe need your help to ensure that lack of gas money or health insurance doesn’t stop the work from moving forward. Supporting our emerging leadership, including our rapid response, \r\norganized resistance, healing and logistics teams, reimbursements and stipends costs on average $20,700/month.', '2020-10-26 19:12:36', '2020-10-26 19:12:36', 'Active', 'No'),
(86, 'Yes', '', 'Invest $ 15,000 in affiliate marketing and get $ 45,000 in a month \r\nHey. \r\nYes, you heard right. \r\nYou don\'t have to do anything. \r\nWe will do all the work for you. \r\nYou only need to invest and wait one month to receive payments. \r\nhttps://blockchain.com/btc/payment_request?address=18gaWYjABVFJ9PhG1hCqjh5FjWBrkQVuwD&amount=1.14&message=invest_in_affiliate_marketing_at_300%_per_month \r\nWe have been engaged in affiliate marketing for many years and decided to attract investments to work in the development of three more areas of our activity. \r\n \r\nYou can only invest one amount because this is the best option for earning super profits in affiliate marketing. \r\nWe give a 100% guarantee that you will receive your profit on time. \r\nhttps://blockchain.com/btc/payment_request?address=18gaWYjABVFJ9PhG1hCqjh5FjWBrkQVuwD&amount=1.14&message=invest_in_affiliate_marketing_at_300%_per_month \r\nAfter you make an investment by clicking on the link, exactly in a month your profit in the amount of 300% will be returned to your wallet from which you made the transfer to our system. \r\n \r\nThe payment is made in one time. \r\nIf you want to receive such a profit every month, then you need to invest every month. \r\nhttps://blockchain.com/btc/payment_request?address=18gaWYjABVFJ9PhG1hCqjh5FjWBrkQVuwD&amount=1.14&message=invest_in_affiliate_marketing_at_300%_per_month \r\nThere are almost two months left before the New Year, during which time you will have time to invest twice and get $ 75,000 in net profit.', '2020-10-28 17:48:34', '2020-10-28 17:48:34', 'Active', 'No'),
(87, 'Yes', 'Right diet which work not only for body but also for hair and skin', '', '2020-10-28 19:29:29', '2020-10-28 19:29:29', 'Active', 'No'),
(88, 'Yes', '', 'Всем привет... nutridock.com \r\nРекламная сеть Richpush или richads заманивает арбитражников сделать первый депозит на 524 долларов и получить реальную прибыль, а в итоге веб мастер остаётся в 95% минусе, так как получает 85% бот трафика. Кроме того, есть подозрение на договоренность с определенным рекламодателем по офферу Suprema гео Индонезия, который шейвит 97% лидов, которые сеть Richpush генерирует каким то специальным софтом. \r\nВ своём отзыве о рекламной компании с RichPush я хочу сообщить, что: \r\n•	Бот-трафик с пушей richads, который дальше прокладки не идёт, так как бот не может прочитать содержимое кнопки для перехода на лендинг. (Кнопка с партнерской ссылкой сделана в виде изображения с текстом на индонезийском: “Да” или “Нет”). \r\n•	Трафик на искусственный оффер продвигаемый сетью Ричадс, который даёт “массовые фейковые конверсии, при минимальном расходе бюджета”, но при смене на нормальный оффер не удаётся получить ни одного заказа. (Протестировано с ПП Everad, leadbit, adcombo, dr.cash). \r\nЯ повёлся на уговоры менеджера и пополнил счёт на 525 WMZ и потом в надежде, что полученные лиды когда то будут приняты добавил ещё 385 долларов на рекламу. В этой статье я подробно написал о своём горьком опыте и сливе 892 долларов впустую в Ричпуш со скриншотами и доказательствами в этой статье:  \r\n<a href=https://obzoroff.shop/richpush/>инструкция richpush</a>. \r\nОб этом предельно ясно написано на популярных форумах: <a href=https://loadzalinks.com/casinos/voodoodreams/#comment-7847>Ричадс - статья о работе с пуш трафиком сети RichAds: обман веб-мастера на 910 долларов loadzalinks.com</a> 545363e', '2020-10-29 12:54:57', '2020-10-29 12:54:57', 'Active', 'No'),
(89, 'Yes', '', 'Hi there \r\n \r\nIf you want to get ahead of your competition, have a higher Domain Authority score. Its just simple as that. \r\nWith our service you get Domain Authority above 50 points in just 30 days. \r\n \r\nThis service is guaranteed \r\n \r\nFor more information, check our service here \r\nhttps://www.monkeydigital.co/Get-Guaranteed-Domain-Authority-50/ \r\n \r\nN E W : \r\nDA60 is now available here \r\nhttps://www.monkeydigital.co/product/moz-da60-seo-plan/ \r\n \r\n \r\nthank you \r\nMike Campbell\r\n \r\nMonkey Digital \r\nsupport@monkeydigital.co', '2020-10-29 21:29:02', '2020-10-29 21:29:02', 'Active', 'No'),
(90, 'Yes', '', 'PASSIVES EINKOMMEN ONLINE VOR 6045 EUR PRO TAG - GONNEN SIE SICH FINANZIELLE FREIHEIT: https://2539euro.page.link/nTeZP1svNBRy27MH6', '2020-10-30 12:38:33', '2020-10-30 12:38:33', 'Active', 'No'),
(91, 'Yes', 'Disease related nutrition', '', '2020-10-30 16:39:34', '2020-10-30 16:39:34', 'Active', 'No'),
(92, 'Yes', '', '', '2020-10-31 23:29:24', '2020-10-31 23:29:24', 'Active', 'No'),
(93, 'Yes', '', 'ONLINE VERDIENEN VON 6958 EUR PRO TAG - IN EINEM MONAT KONNEN SIE SICH EIN TEURES AUTO KAUFEN: https://3526589euro.page.link/FBny6kp5Zdafwtvh7', '2020-11-01 03:43:10', '2020-11-01 03:43:10', 'Active', 'No'),
(94, 'Yes', 'User friendly and effective information that\'s not freely available on the internet', '', '2020-11-01 10:36:32', '2020-11-01 10:36:32', 'Active', 'No'),
(95, 'Yes', '', 'PASSIVES EINKOMMEN IM INTERNET VOR 8757 EURO AM TAG - IN EINEM MONAT KONNEN SIE SICH EIN TEURES HAUS KAUFEN: https://8569euro.page.link/e5SMWLbTWUKmgpzr7', '2020-11-02 14:48:49', '2020-11-02 14:48:49', 'Active', 'No'),
(96, 'Yes', '', 'Incredible update of captcha regignizing software \"XRumer 19.0 + XEvil\": \r\n \r\nCaptchas regignizing of Google (ReCaptcha-2 and ReCaptcha-3), Facebook, BitFinex, Bing, Hotmail, SolveMedia, Yandex, \r\nand more than 12000 another size-types of captcha, \r\nwith highest precision (80..100%) and highest speed (100 img per second). \r\nYou can use XEvil 5.0 with any most popular SEO/SMM programms: iMacros, XRumer, SERP Parser, GSA SER, RankerX, ZennoPoster, Scrapebox, Senuke, FaucetCollector and more than 100 of other programms. \r\n \r\nInterested? There are a lot of introducing videos about XEvil in YouTube. \r\n \r\nFREE DEMO AVAILABLE! \r\n \r\nGood luck!', '2020-11-02 17:11:56', '2020-11-02 17:11:56', 'Active', 'No'),
(97, 'Yes', '', 'Cоngratulations! \r\nYou cаn claim $1,600 FREE if yоu win: https://bonus4millionaire1.life/?u=41nkd08&o=8dbpkzp <== Personal Link', '2020-11-03 07:41:51', '2020-11-03 07:41:51', 'Active', 'No'),
(98, 'Yes', '', 'Hey. \r\n \r\nI have more than $ 15,000 passive income per week on cloud mining \r\n \r\nI only invested once and now my passive income is about $ 2400 per day https://ecuadortenisclub.com/3keqa \r\n \r\nPayments to my wallet come every day https://links.wtf/fOge \r\n \r\nIf interested, you can also start making money this way http://gongpo.moum.kr/33cq \r\n \r\nThe number of cloud miners is limited, hurry up to take the right step to success https://links.wtf/vB4a', '2020-11-04 11:37:47', '2020-11-04 11:37:47', 'Active', 'No'),
(99, 'Yes', '', 'Cool website!\r\n\r\nMy name’s Eric, and I just found your site - nutridock.com - while surfing the net. You showed up at the top of the search results, so I checked you out. Looks like what you’re doing is pretty cool.\r\n \r\nBut if you don’t mind me asking – after someone like me stumbles across nutridock.com, what usually happens?\r\n\r\nIs your site generating leads for your business? \r\n \r\nI’m guessing some, but I also bet you’d like more… studies show that 7 out 10 who land on a site wind up leaving without a trace.\r\n\r\nNot good.\r\n\r\nHere’s a thought – what if there was an easy way for every visitor to “raise their hand” to get a phone call from you INSTANTLY… the second they hit your site and said, “call me now.”\r\n\r\nYou can –\r\n  \r\nTalk With Web Visitor is a software widget that’s works on your site, ready to capture any visitor’s Name, Email address and Phone Number.  It lets you know IMMEDIATELY – so that you can talk to that lead while they’re literally looking over your site.\r\n\r\nCLICK HERE http://www.talkwithcustomer.com to try out a Live Demo with Talk With Web Visitor now to see exactly how it works.\r\n\r\nTime is money when it comes to connecting with leads – the difference between contacting someone within 5 minutes versus 30 minutes later can be huge – like 100 times better!\r\n\r\nThat’s why we built out our new SMS Text With Lead feature… because once you’ve captured the visitor’s phone number, you can automatically start a text message (SMS) conversation.\r\n  \r\nThink about the possibilities – even if you don’t close a deal then and there, you can follow up with text messages for new offers, content links, even just “how you doing?” notes to build a relationship.\r\n\r\nWouldn’t that be cool?\r\n\r\nCLICK HERE http://www.talkwithcustomer.com to discover what Talk With Web Visitor can do for your business.\r\n\r\nYou could be converting up to 100X more leads today!\r\nEric\r\n\r\nPS: Talk With Web Visitor offers a FREE 14 days trial – and it even includes International Long Distance Calling. \r\nYou have customers waiting to talk with you right now… don’t keep them waiting. \r\nCLICK HERE http://www.talkwithcustomer.com to try Talk With Web Visitor now.\r\n\r\nIf you\'d like to unsubscribe click here http://talkwithcustomer.com/unsubscribe.aspx?d=nutridock.com', '2020-11-04 17:21:58', '2020-11-04 17:21:58', 'Active', 'No'),
(100, 'Yes', '', 'Gооd dаy! \r\nI have just checked nutridock.com for the ranking keywords and seen that your SEO metrics could use a boost. \r\n \r\nWe will improve your SEO metrics and ranks organically and safely, using only whitehat methods, while providing monthly reports and outstanding support. \r\n \r\nPlease check our pricelist here, we offer SEO at cheap rates. \r\nhttps://www.hilkom-digital.de/cheap-seo-packages/ \r\n \r\nStart increasing your sales and leads with us, today! \r\n \r\nregards \r\nHilkom Digital Team \r\nsupport@hilkom-digital.de', '2020-11-05 04:06:35', '2020-11-05 04:06:35', 'Active', 'No'),
(101, 'Yes', '', 'Hello, \r\n \r\nAre you interested in wholesale / at home Covid-19 Rapid Antibody Test Kits? \r\nThese kits are ideal for home, office, schools, churches, spas, gyms, chiropractors, dentists, hotels, and more. \r\n \r\n \r\nWe have available: \r\n \r\n- Covid-19 Rapid Antibody Tests \r\n- Minimum order size is 1 box= 25 kits \r\n- Simple to use, made for Home, Office, School use \r\n- Affordable & Accurate \r\n- 4 Simple Steps! \r\n- FDA Authorized \r\n- Results back, privately in 10-15 minutes \r\n- Self administer the test \r\n- We are based in the US and ship out orders every day \r\n \r\n \r\n \r\nOur tests make it possible to provide quick, accurate and affordable clinical results to all members of your community. \r\n \r\n \r\nMinimum order size is only 1 box= 25 kits.  We offer bulk wholesale rates - let us know how many you would like? \r\n \r\nPlease reply back stacy@productsupply.net  with the quantity needed, and the best contact phone number to call you \r\n \r\n \r\nThank you ! \r\n \r\n \r\nStacy Williams \r\nC Rapid Test Results \r\nRegional Marketing Manager \r\nstacy@productsupply.net', '2020-11-05 22:36:54', '2020-11-05 22:36:54', 'Active', 'No'),
(102, 'Yes', '', 'PASSIVE INCOME ON THE INTERNET FROM 7778 EUR IN WEEK - NO WORK SKILLS: http://wunkit.com/ITooAA', '2020-11-05 23:24:02', '2020-11-05 23:24:02', 'Active', 'No'),
(103, 'Yes', 'Info graphic images', '', '2020-11-06 15:43:46', '2020-11-06 15:43:46', 'Active', 'No'),
(104, 'No', '', '', '2020-11-06 16:43:43', '2020-11-06 16:43:43', 'Active', 'No'),
(105, 'Yes', '', '', '2020-11-06 19:14:10', '2020-11-06 19:14:10', 'Active', 'No'),
(106, 'Yes', 'harryrao94@gmail.com', '', '2020-11-06 22:22:32', '2020-11-06 22:22:32', 'Active', 'No'),
(107, 'Yes', '', '', '2020-11-06 23:44:47', '2020-11-06 23:44:47', 'Active', 'No'),
(108, 'Yes', 'Diet plan', '', '2020-11-07 11:41:11', '2020-11-07 11:41:11', 'Active', 'No'),
(109, 'Yes', 'Yes', '', '2020-11-07 14:51:25', '2020-11-07 14:51:25', 'Active', 'No'),
(110, 'Yes', '', 'EARNING ONLINE BEFORE 9633 EUR IN A DAY - YOU WILL PAY OFF ALL YOUR LOANS IN A WEEK: https://ecuadortenisclub.com/3key7', '2020-11-07 16:37:45', '2020-11-07 16:37:45', 'Active', 'No'),
(111, 'Yes', '', '', '2020-11-07 19:11:59', '2020-11-07 19:11:59', 'Active', 'No'),
(112, 'Yes', '', 'RE: nutridock.com / Nutridock SITE SOLUTIONS\r\nThis notification RUNS OUT ON: Nov 07, 2020\r\n\r\n\r\nWe have not received a payment from you.\r\nWe\'ve tried to call you but were incapable to reach you.\r\n\r\n\r\nPlease Check Out: https://saveonyourdomain.com/?web=nutridock.com\r\n\r\nFor details as well as to process a optional payment for services.\r\n\r\nThank you.\r\n\r\n110720201034314364235', '2020-11-07 21:10:38', '2020-11-07 21:10:38', 'Active', 'No'),
(113, 'Yes', '', 'I will do 961 DA 65-96 SEO Links for Top rankings on Google 2021. \r\n \r\nTier 1 - 31 SEO links DA 75-96 \r\n \r\nTier 2 - 930 SEO links DA 75-96 \r\n \r\nThese links are really effective for Page 1 rankings and Top 3 Positions and all are Google Compliant. \r\n \r\nhttps://ecuadortenisclub.com/3nhqt \r\n \r\nPanda Penguin Hummingbird Safe \r\n \r\nImproves the Metrics of your Website like Trust flow and Citations \r\n \r\nEnables your Website to rank for any top Keywords \r\n \r\nProven Results, worked well for 100+ Websites tested this year. \r\n \r\nhttps://darknesstr.com/3mfuv \r\n \r\n+ High quality backlinks \r\n+ Safe on latest algorithm (2020 updated) \r\n+ Full reports (.txt) \r\n+ White hat and Extremely Safe method \r\n+ According to latest google updated 2020 \r\n+ Google Loves the High DA Bcklinks \r\n+ 100% Google Safe \r\n+ Full Verified Backlinks \r\n+ Rankings and Get More Authority \r\n \r\nhttps://jtbtigers.com/3m90n', '2020-11-08 17:22:46', '2020-11-08 17:22:46', 'Active', 'No'),
(114, 'Yes', '', 'Good evening people at %domain,\r\nWe\'d like to submit your business to 150 local citations, business directories & yellow pages.\r\nYou\'ll get new clients and boost your website visitors.\r\nYou pay once and enjoy the benefits for a lifetime. \r\nhttps://b2bworld.store\r\nGood luck!', '2020-11-09 19:42:47', '2020-11-09 19:42:47', 'Active', 'No'),
(115, 'Yes', '', 'PASSIVES EINKOMMEN IM INTERNET VOR 5756 EURO PRO TAG - GONNEN SIE SICH FINANZIELLE FREIHEIT: https://28569euro.page.link/V2t9uBXuw5SVyVb18', '2020-11-10 12:11:25', '2020-11-10 12:11:25', 'Active', 'No');

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `post` varchar(50) NOT NULL,
  `details` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_deleted` enum('No','Yes') NOT NULL,
  `status` enum('Active','Inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `name`, `post`, `details`, `image`, `created_at`, `updated_at`, `is_deleted`, `status`) VALUES
(1, 'Merry', 'Freelancer', 'Lorem ipsum, or lipsum\' as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s De Finibus Bonorum et Malorum for use in a type specimen book.', '708c5e20d504cb753b8bd9eff5c310b3ac243eee.jpg', '2020-10-13 17:29:33', '2020-11-06 15:41:43', 'No', 'Active'),
(2, 'Saul Goodman', 'Ceo Founder', 'Proin iaculis purus consequat sem cure digni ssim donec porttitora entum suscipit rhoncus. Accusantium quam, ultricies eget id, aliquam eget nibh et. Maecen aliquam, risus at semper.', 'c507e7171c37621b74ec41cd4202e316e350f179.jpg', '2020-10-13 17:55:21', '2020-10-14 17:56:17', 'No', 'Active'),
(3, 'Anonymous User', 'Self Employed', 'We love the variety of produce that we receive from you every week and the challenge of cooking creatively to use everything you deliver. Thank you for the great service!', '79485f092bff9c21457abe5d11d5aca06f77de38.jpg', '2020-10-24 16:35:38', '2020-11-02 16:43:42', 'No', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `top_categories`
--

CREATE TABLE `top_categories` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `dish_name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `multiple_image` varchar(500) NOT NULL,
  `dish_special` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_deleted` enum('No','Yes') NOT NULL,
  `status` enum('Active','Inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `roles`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@email.com', '', NULL, '$2y$10$iMenrTsyTlukPiv8a/pNJOn9DscJfaV4q/ez2dV4T7mO9tWo16WkS', NULL, '2020-08-17 03:57:08', '2020-08-17 03:57:08'),
(2, 'Mrketing', 'marketing@nutridock.com', 'Webinar', NULL, '$2y$10$O1So44k9EKxyeRIdsL9l3eREAHG1/fdki2y/pgnzUcXGA2Yhx6y/W', 'aRnQCFsaKrQc3YFRHBkTP6wQrbDXGFSjjqhZ7jLObrSwZ9DQ8CDKgtPfftWk', '2020-09-02 06:38:37', '2020-09-02 06:38:37');

-- --------------------------------------------------------

--
-- Table structure for table `webinar`
--

CREATE TABLE `webinar` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` bigint(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `age` varchar(50) NOT NULL,
  `webinar_date` datetime NOT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `zoom_link` varchar(255) NOT NULL,
  `payment_status` varchar(255) NOT NULL DEFAULT 'Initiated',
  `created_at` varchar(255) DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `webinar`
--

INSERT INTO `webinar` (`id`, `name`, `email`, `mobile`, `city`, `age`, `webinar_date`, `transaction_id`, `amount`, `zoom_link`, `payment_status`, `created_at`, `updated_at`) VALUES
(1, 'bJXYjQtxfz', 'laxmipagare99@gmail.com', 9047537499, 'YjnPANkVCpftER', 'qPJTAkVaiF', '2020-09-02 18:06:00', NULL, '150', '', 'Initiated', '2020-09-02 06:54:33', '2020-09-02 06:54:33'),
(2, 'uAHMklyIoCVh', 'webdeveloper@techrupt.in', 3524342600, 'opleKzcsGDAiXu', 'IDRoTawzuXivUs', '2020-09-01 18:06:09', NULL, '150', '', 'Initiated', '2020-09-02 06:54:43', '2020-09-02 06:54:43'),
(5, 'Testing', 'laxmipagare99@gmail.com', 9284225229, 'saaa', '27', '2020-09-05 11:23:54', 'pay_FZEwZbmRn0GFSM', '150', '', 'Paid', '2020-09-05 11:23:41', '2020-09-05 11:23:41'),
(6, 'Testing', 'webdeveloper@techrupt.in', 9284225229, 'saaa', '27', '2020-09-05 11:28:45', 'pay_FZF1hGPDMD9eTr', '150', '', 'Paid', '2020-09-05 11:28:26', '2020-09-05 11:28:26'),
(7, 'Testing1', 'webdeveloper@techrupt.in', 9284225229, 'saaa', '27', '2020-09-05 11:29:27', 'pay_FZF2QMcp4B3HxB', '150', '', 'Initiated', '2020-09-05 11:29:08', '2020-09-05 11:29:08'),
(8, 'Testing', 'webdeveloper@techrupt.in', 9284225229, 'saaa', '27', '2020-09-05 11:38:05', 'pay_FZFBY2PaU4oOva', '150', '', 'Initiated', '2020-09-05 11:37:51', '2020-09-05 11:37:51'),
(9, 'Laxmi Pagare', 'webdeveloper@techrupt.in', 9284225229, 'Nashik', '27', '0000-00-00 00:00:00', NULL, '150', '', 'Initiated', '2020-09-05 16:07:24', '2020-09-05 16:07:24'),
(10, 'Laxmi Pagare', 'webdeveloper@techrupt.in', 9284225229, 'Nashik', '27', '0000-00-00 00:00:00', NULL, '150', '', 'Initiated', '2020-09-05 16:09:44', '2020-09-05 16:09:44'),
(11, 'Laxmi Pagare', 'webdeveloper@techrupt.in', 9284225229, 'Nashik', '27', '2020-09-05 04:12:33', 'pay_FZJrRIz2hipGaj', '150', '', 'Paid', '2020-09-05 16:12:12', '2020-09-05 16:12:12'),
(12, 'Laxmi Pagare', 'webdeveloper@techrupt.in', 9284225229, 'Nashik', '27', '2020-09-05 04:37:22', 'pay_FZKHeHxOfoqYch', '150', '', 'Paid', '2020-09-05 16:36:56', '2020-09-05 16:36:56'),
(13, 'Urvashi Tikmani', 'urvashitikmani1310@gmail.com', 8375833971, 'Nashik', '23', '0000-00-00 00:00:00', NULL, '150', '', 'Initiated', '2020-09-05 19:12:35', '2020-09-05 19:12:35'),
(14, 'Urvashi Tikmani', 'urvashitikmani1310@gmail.com', 8375833971, 'Nashik', '23', '0000-00-00 00:00:00', NULL, '150', '', 'Initiated', '2020-09-05 19:14:53', '2020-09-05 19:14:53'),
(15, 'Urvashi Tikmani', 'urvashitikmani1310@gmail.com', 8375833971, 'Nashik', '23', '0000-00-00 00:00:00', NULL, '150', '', 'Initiated', '2020-09-05 19:16:08', '2020-09-05 19:16:08'),
(16, 'Surendra Singh', 'surendrajnvu@gmail.com', 7028102190, 'Nashik', '30', '0000-00-00 00:00:00', NULL, '150', '', 'Initiated', '2020-09-05 19:31:14', '2020-09-05 19:31:14'),
(17, 'Siddharth Dhabriya', 'siddharth.dhabriya@gmail.com', 9829622000, 'Jaipur', '23', '2020-09-05 07:53:17', 'pay_FZNcNoOFpMn4U0', '150', '', 'Paid', '2020-09-05 19:49:59', '2020-09-05 19:49:59'),
(18, 'urvashi tikmani', 'urvashitikmani1310@gmail.com', 8375833971, 'abc', '23', '0000-00-00 00:00:00', NULL, '150', '', 'Initiated', '2020-09-05 19:51:37', '2020-09-05 19:51:37');

-- --------------------------------------------------------

--
-- Table structure for table `whats_inside`
--

CREATE TABLE `whats_inside` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `unit` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` enum('Active','Inactive') NOT NULL,
  `is_deleted` enum('No','Yes') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `whats_inside`
--

INSERT INTO `whats_inside` (`id`, `title`, `menu_id`, `unit`, `created_at`, `updated_at`, `status`, `is_deleted`) VALUES
(80, 'Calories', 42, '255 kcal', '0000-00-00 00:00:00', '2020-11-28 16:43:06', 'Active', 'No'),
(81, 'Proteins', 42, '6.31 g', '0000-00-00 00:00:00', '2020-11-28 16:43:11', 'Active', 'No'),
(82, 'Carbohydrates', 42, '28.93 g', '0000-00-00 00:00:00', '2020-11-28 16:43:16', 'Active', 'No'),
(83, 'Fats', 42, '12 g', '0000-00-00 00:00:00', '2020-11-28 16:43:21', 'Active', 'No'),
(84, 'Calories', 41, '259 kcal', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(85, 'Proteins', 41, '14 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(86, 'Carbohydrates', 41, '45.4 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(87, 'Fats', 41, '4.6 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(88, 'Calories', 40, '206 kcal', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(89, 'Proteins', 40, '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(90, 'Carbohydrates', 40, '43.2 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(91, 'Fats', 40, '2 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(92, 'Calories', 39, '265 kcal', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(93, 'Proteins', 39, '4.8 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(94, 'Carbohydrates', 39, '24 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(95, 'Fats', 39, '16.75 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(96, 'Calories', 38, '168 kcal', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(97, 'Proteins', 38, '4.13 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(98, 'Carbohydrates', 38, '17.7 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(99, 'Fats', 38, '10.27 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(100, 'Calories', 37, '131 kcal', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(101, 'Proteins', 37, '2.5 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(102, 'Carbohydrates', 37, '26.75 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(103, 'Fats', 37, '0.75 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(104, 'Calories', 36, '118 kcal', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(105, 'Proteins', 36, '1.5 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(106, 'Carbohydrates', 36, '24.9 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(107, 'Fats', 36, '0.45 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(108, 'Calories', 34, '100 kcal', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(109, 'Proteins', 34, '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(110, 'Carbohydrates', 34, '22 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(111, 'Fats', 34, '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(120, 'Calories', 33, '307 kcal', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(121, 'Proteins', 33, '11 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(122, 'Carbohydrates', 33, '25.34 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(123, 'Fats', 33, '17.95 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(124, 'Calories', 32, '334 kcal', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(125, 'Proteins', 32, '6 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(126, 'Carbohydrates', 32, '65 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(127, 'Fats', 32, '7.8 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(128, 'Calories', 31, '225 kcal', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(129, 'Proteins', 31, '6.55 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(130, 'Carbohydrates', 31, '32.5 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(131, 'Fats', 31, '6.38 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(132, 'Calories', 30, '597 kcal', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(133, 'Proteins', 30, '23.8 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(134, 'Carbohydrates', 30, '42.38 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(135, 'Fats', 30, '37.33 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(136, 'Calories', 29, '486 kcal', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(137, 'Proteins', 29, '7.46 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(138, 'Carbohydrates', 29, '53.3 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(139, 'Fats', 29, '25.12 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(140, 'Calories', 28, '607 kcal', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(141, 'Proteins', 28, '13.45 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(142, 'Carbohydrates', 28, '54 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(143, 'Fats', 28, '35.81 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(144, 'Calories', 27, '225 kcal', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(145, 'Proteins', 27, '6.55 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(146, 'Carbohydrates', 27, '32.5 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(147, 'Fats', 27, '6.38 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(148, 'Calories', 26, '564 kcal', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(149, 'Proteins', 26, '3.79 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(150, 'Carbohydrates', 26, '55.8 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(151, 'Fats', 26, '34.43 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(152, 'Calories', 25, '469 kcal', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(153, 'Proteins', 25, '13.54 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(154, 'Carbohydrates', 25, '53 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(155, 'Fats', 25, '20.7 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(156, 'Calories', 24, '417 kcal', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(157, 'Proteins', 24, '22.61 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(158, 'Carbohydrates', 24, '42.04 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(159, 'Fats', 24, '18.22 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(160, 'Calories', 23, '255 kcal', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(161, 'Proteins', 23, '6.31 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(162, 'Carbohydrates', 23, '28.93 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(163, 'Fats', 23, '12 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(164, 'Calories', 22, '571 kcal', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(165, 'Proteins', 22, '20.25 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(166, 'Carbohydrates', 22, '66.1 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(167, 'Fats', 22, '20.55 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(168, 'Calories', 21, '474 kcal', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(169, 'Proteins', 21, '15.27 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(170, 'Carbohydrates', 21, '84.35 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(171, 'Fats', 21, '18.34 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(172, 'Calories', 20, '362 kcal', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(173, 'Proteins', 20, '14.94 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(174, 'Carbohydrates', 20, '53.68 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(175, 'Fats', 20, '5.48 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(176, 'Calories', 19, '542 kcal', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(177, 'Proteins', 19, '25.49 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(178, 'Carbohydrates', 19, '85.21 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(179, 'Fats', 19, '7 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(180, 'Calories', 18, '389 kcal', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(181, 'Proteins', 18, '17.81 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(182, 'Carbohydrates', 18, '43.83 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(183, 'Fats', 18, '20 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(184, 'Calories', 17, '363 kcal', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(185, 'Proteins', 17, '12.45 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(186, 'Carbohydrates', 17, '41.2 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(187, 'Fats', 17, '18.12 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(188, 'Calories', 16, '270 kcal', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(189, 'Proteins', 16, '15.97 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(190, 'Carbohydrates', 16, '36.27 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(191, 'Fats', 16, '9.19 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(192, 'Calories', 15, '520 kcal', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(193, 'Proteins', 15, '9 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(194, 'Carbohydrates', 15, '51.15 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(195, 'Fats', 15, '41.28 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(196, 'Calories', 14, '170 kcal', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(197, 'Proteins', 14, '7.97 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(198, 'Carbohydrates', 14, '23.5 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(199, 'Fats', 14, '5 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(200, 'Calories', 12, '333 kcal', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(201, 'Proteins', 12, '10 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(202, 'Carbohydrates', 12, '42.37 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(203, 'Fats', 12, '17.61 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(204, 'Calories', 11, '379 kcal', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(205, 'Proteins', 11, '14.93 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(206, 'Carbohydrates', 11, '41.21 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No'),
(207, 'Fats', 11, '17.5 g', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Active', 'No');

-- --------------------------------------------------------

--
-- Table structure for table `why_us`
--

CREATE TABLE `why_us` (
  `id` int(11) NOT NULL,
  `title` varchar(155) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `title_description` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_deleted` enum('No','Yes') NOT NULL,
  `status` enum('Active','Inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `why_us`
--

INSERT INTO `why_us` (`id`, `title`, `image`, `description`, `title_description`, `created_at`, `updated_at`, `is_deleted`, `status`) VALUES
(14, 'An in-house celebrity chef', '32501b1a8ccece85df9eacf21a5f284fe8e8221d.jpg', 'We don’t just offer you suggestions for a healthy lifestyle but also make them actionable through our in-house celebrity chef and renowned nutritionist.', 'The celebrity chef, Rakesh Talwar, is on board! He is often seen amongst the bigwigs flipping mouthwatering dishes besides being the man behind some of our favourite fine dining places in Mumbai. With over 35 years of international experience and a flair for experimentation, he is here to take your taste buds for a ride with the best looking healthy dishes.', '2020-10-24 15:48:00', '2020-12-04 13:01:10', 'No', 'Active'),
(15, 'A founder who is a man of his words', 'b0230de18d541dfa4e08e926694be512a2074924.png', 'We don’t just offer you suggestions for a healthy lifestyle but also make them actionable through our in-house celebrity chef and renowned nutritionist.', 'Nutridock is not a business model but a vision and a mission to make healthy living sustainable and achievable for all. Aditya Bafna, our founder, exemplifies the fact that nutrition can make a world of difference in our lives. He wants all of us to rejoice in mental and physical well being, which comes with adopting a healthy lifestyle.', '2020-10-24 15:50:10', '2020-12-04 18:14:18', 'No', 'Active'),
(21, 'A diet maestro', '7647f9fb9364432334993fa44125fade8b502448.jpg', '', 'Anagha, an expert nutritionist, with an experience of more than 5 years in the field, is here to help you make more informed choices. At Nutridock, you can leverage her rich background in the field; to approach fitness in a 360 degrees holistic manner. Stop hitting in the dark and start seeing concrete results.', '2020-11-10 11:45:59', '2020-12-04 13:00:53', 'No', 'Active');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about_us`
--
ALTER TABLE `about_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `benefits`
--
ALTER TABLE `benefits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments_reply`
--
ALTER TABLE `comments_reply`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `food_avoid`
--
ALTER TABLE `food_avoid`
  ADD PRIMARY KEY (`food_avoid_id`);

--
-- Indexes for table `how_we_work`
--
ALTER TABLE `how_we_work`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meal_type`
--
ALTER TABLE `meal_type`
  ADD PRIMARY KEY (`meal_type_id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu1`
--
ALTER TABLE `menu1`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_categories`
--
ALTER TABLE `menu_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_specification`
--
ALTER TABLE `menu_specification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newsletter`
--
ALTER TABLE `newsletter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `our_chefs`
--
ALTER TABLE `our_chefs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `our_healthy_farm`
--
ALTER TABLE `our_healthy_farm`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `our_services`
--
ALTER TABLE `our_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `physical_activity`
--
ALTER TABLE `physical_activity`
  ADD PRIMARY KEY (`physical_activity_id`);

--
-- Indexes for table `pincode`
--
ALTER TABLE `pincode`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `specification`
--
ALTER TABLE `specification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribe_discount`
--
ALTER TABLE `subscribe_discount`
  ADD PRIMARY KEY (`subscribe_discount_id`);

--
-- Indexes for table `subscribe_now1`
--
ALTER TABLE `subscribe_now1`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribe_now_plan`
--
ALTER TABLE `subscribe_now_plan`
  ADD PRIMARY KEY (`subscribe_now_plan_id`);

--
-- Indexes for table `subscribe_now_plan_duration`
--
ALTER TABLE `subscribe_now_plan_duration`
  ADD PRIMARY KEY (`subscribe_now_plan_duration_id`);

--
-- Indexes for table `subscription`
--
ALTER TABLE `subscription`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscription2`
--
ALTER TABLE `subscription2`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `survey`
--
ALTER TABLE `survey`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `top_categories`
--
ALTER TABLE `top_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `webinar`
--
ALTER TABLE `webinar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `whats_inside`
--
ALTER TABLE `whats_inside`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `why_us`
--
ALTER TABLE `why_us`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `about_us`
--
ALTER TABLE `about_us`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `benefits`
--
ALTER TABLE `benefits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `blog`
--
ALTER TABLE `blog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `comments_reply`
--
ALTER TABLE `comments_reply`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT for table `faq`
--
ALTER TABLE `faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `food_avoid`
--
ALTER TABLE `food_avoid`
  MODIFY `food_avoid_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `how_we_work`
--
ALTER TABLE `how_we_work`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ingredients`
--
ALTER TABLE `ingredients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT for table `meal_type`
--
ALTER TABLE `meal_type`
  MODIFY `meal_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `menu1`
--
ALTER TABLE `menu1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `menu_categories`
--
ALTER TABLE `menu_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `menu_specification`
--
ALTER TABLE `menu_specification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `newsletter`
--
ALTER TABLE `newsletter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `our_chefs`
--
ALTER TABLE `our_chefs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `our_healthy_farm`
--
ALTER TABLE `our_healthy_farm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `our_services`
--
ALTER TABLE `our_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `physical_activity`
--
ALTER TABLE `physical_activity`
  MODIFY `physical_activity_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pincode`
--
ALTER TABLE `pincode`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `slider`
--
ALTER TABLE `slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `specification`
--
ALTER TABLE `specification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `subscribe_discount`
--
ALTER TABLE `subscribe_discount`
  MODIFY `subscribe_discount_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `subscribe_now1`
--
ALTER TABLE `subscribe_now1`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `subscribe_now_plan`
--
ALTER TABLE `subscribe_now_plan`
  MODIFY `subscribe_now_plan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `subscribe_now_plan_duration`
--
ALTER TABLE `subscribe_now_plan_duration`
  MODIFY `subscribe_now_plan_duration_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `subscription`
--
ALTER TABLE `subscription`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1213;

--
-- AUTO_INCREMENT for table `subscription2`
--
ALTER TABLE `subscription2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `survey`
--
ALTER TABLE `survey`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `top_categories`
--
ALTER TABLE `top_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `webinar`
--
ALTER TABLE `webinar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `whats_inside`
--
ALTER TABLE `whats_inside`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=208;

--
-- AUTO_INCREMENT for table `why_us`
--
ALTER TABLE `why_us`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
