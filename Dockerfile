FROM ubuntu:22.04

# تثبيت مكتبات ضرورية لتشغيل برنامج Godot السيرفر
RUN apt-get update && apt-get install -y libglib2.0-0 libx11-6 libxcursor1 libxrandr2 libxinerama1 libxi6 libasound2 libpulse0 libssl-dev curl

# نسخ ملفات السيرفر إلى الحاوية
WORKDIR /app
COPY server.x86_64 .
COPY server.sh .

# تعيين صلاحية تنفيذ لملف السيرفر و السكربت
RUN chmod +x server.x86_64 server.sh

# أمر تشغيل السيرفر عند بدء الحاوية
CMD ["./server.sh"]
