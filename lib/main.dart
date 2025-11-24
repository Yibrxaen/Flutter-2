import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false, 
      home: DefaultTabController (
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Tab'),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.login), text: 'Login'),
                Tab(icon: Icon(Icons.text_fields), text: 'TextField'),
                Tab(icon: Icon(Icons.add), text: 'Counter'),
              ],  
            ),
          runApp(
            const MyApp(),
          );
        }

        class MyApp extends StatelessWidget {
          const MyApp({super.key});

          @override
          Widget build(BuildContext context) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Styled Tabs',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: const HomeTabs(),
            );
          }
        }

        class HomeTabs extends StatelessWidget {
          const HomeTabs({super.key});

          @override
          Widget build(BuildContext context) {
            return DefaultTabController(
              length: 3,
              child: Scaffold(
                appBar: AppBar(
                  title: const Text('Tab'),
                  bottom: const TabBar(tabs: [
                    Tab(icon: Icon(Icons.login), text: 'Login'),
                    Tab(icon: Icon(Icons.text_fields), text: 'Info'),
                    Tab(icon: Icon(Icons.add), text: 'Sample'),
                  ]),
                ),
                body: const TabBarView(children: [
                  StyledCardTab(
                    title: 'Login',
                    imageUrl:
                        'https://picsum.photos/seed/login/900/500',
                    content:
                        'นี่คือหน้าล็อกอินตัวอย่างของแอปพลิเคชัน\n\nกรุณากรอกชื่อผู้ใช้งานและรหัสผ่านของคุณ เพื่อเข้าสู่ระบบ แอปจะเก็บข้อมูลตามนโยบายความเป็นส่วนตัวของเรา และไม่เผยแพร่ข้อมูลโดยไม่ได้รับอนุญาต',
                  ),
                  StyledCardTab(
                    title: 'Mobile Legends',
                    imageUrl:
                        'https://img.utdstc.com/icon/78d/66f/78d66ff1ab1bd23f7fd6d9cdb93854881cb8f0b69e8a301faaf4f4eab058d19e:200',
                    content:
                        'Mobile Legends (Bang Bang) เป็นเกมมือถือแนว MOBA แบบ 5v5 ที่ผู้เล่นต้องร่วมมือกันเพื่อต่อสู้และทำลายฐานของฝ่ายตรงข้าม\n\n- ประเภท: MOBA\n- โหมด: 5v5\n- ระยะเวลาเกมโดยประมาณ: 10 นาที\n\nเกมเน้นการเล่นเป็นทีมและกลยุทธ์ มีการอัปเดตเนื้อหาและกิจกรรมอย่างสม่ำเสมอ',
                  ),
                  StyledCardTab(
                    title: 'Sample 3',
                    imageUrl:
                        'https://stickershop.line-scdn.net/stickershop/v1/product/23701012/LINEStorePC/main.png?v=1',
                    content:
                        'ตัวอย่างเนื้อหาแท็บที่ 3\n\nใส่คำอธิบายหรือเนื้อหาอื่น ๆ ได้ที่นี่ โดยใช้รูปภาพและข้อความที่จัดวางอย่างสวยงาม',
                  ),
                ]),
              ),
            );
          }
        }

        class StyledCardTab extends StatelessWidget {
          final String title;
          final String imageUrl;
          final String content;

          const StyledCardTab({
            super.key,
            required this.title,
            required this.imageUrl,
            required this.content,
          });

          @override
          Widget build(BuildContext context) {
            final theme = Theme.of(context);
            return SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 900),
                    child: Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Image (responsive height)
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                            child: Image.network(
                              imageUrl,
                              height: MediaQuery.of(context).size.width > 600 ? 260 : 180,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              loadingBuilder: (context, child, progress) {
                                if (progress == null) return child;
                                return SizedBox(
                                  height: MediaQuery.of(context).size.width > 600 ? 260 : 180,
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      value: progress.expectedTotalBytes != null
                                          ? progress.cumulativeBytesLoaded / (progress.expectedTotalBytes ?? 1)
                                          : null,
                                    ),
                                  ),
                                );
                              },
                              errorBuilder: (context, error, stack) => Container(
                                height: MediaQuery.of(context).size.width > 600 ? 260 : 180,
                                color: Colors.grey.shade200,
                                child: const Center(child: Icon(Icons.broken_image, size: 48)),
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(18),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(title, style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                                const SizedBox(height: 8),
                                Text(content, style: theme.textTheme.bodyMedium, textAlign: TextAlign.left),
                                const SizedBox(height: 16),

                                // Example actions row
                                Row(
                                  children: [
                                    ElevatedButton.icon(
                                      onPressed: () {
                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$title: Login pressed')));
                                      },
                                      icon: const Icon(Icons.login),
                                      label: const Text('Login'),
                                      style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12)),
                                    ),
                                    const SizedBox(width: 12),
                                    OutlinedButton(
                                      onPressed: () {
                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$title: Register pressed')));
                                      },
                                      child: const Text('Register'),
                                      style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12)),
                                    ),
                                    const Spacer(),
                                    TextButton(
                                      onPressed: () {
                                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Forgot password?')));
                                      },
                                      child: const Text('Forgot password?'),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
        }