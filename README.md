# 1. What is PostgreSQL?

<p>PostgreSQL একটি ওপেন সোর্স শক্তিশালী অব্জেক্ট রিলেশনাল ডাটাবেস মানেজমেন্ট সিস্টেম। যাতে  উন্নত ফিচার, স্টাবিলিটি ও আদর্শ SQL ডাটাবেস ম্যানেজমেন্ট সিস্টেম কে অনুসরন করে। এটিকে সংক্ষিপ্ত ভাবে Postgress নামেও বলা হয়। তাছাড়া এর উন্নত ডাটা টাইপ, মাল্টি ইউজার এক্সেস, দ্রুততা, ডাটা নিরাপত্তা, ক্রস-প্লাটফর্ম ডাটা রিডিং সহ আরো উন্নত ফিচারের জন্য অনেক জনপ্রিয় একটি ডাটাবেস সিস্টেম এ পরিণত হয়ে উঠেছে। </p>

# 2. Explain the Primary Key and Foreign Key concepts in PostgreSQL.

<p>
ডাটাবেস সিস্টেমে কি হচ্ছে একটি কলাম অথবা একাধিক কলামের সমষ্টি, যা একটি নির্দিষ্ট রো কে চিহ্নিত করে। যার মাধ্যমে একটি ডাটাবেসের অসংখ্য রেকর্ড থেকে নির্দিষ্ট রেকর্ডকে খুজে পাওয়া যায়। 
</p>

## Primary Key

<p>যখন কোন ডাটাবেস সিস্টেমের টেবিলের কোন কলাম কে ইউনিক আইডেন্টিফায়ার হিসাবে ব্যবহার করা হয় তখন সেটা কে প্রাথমিক কি বলে।  </p>

CREATE TABLE students (<br>
student_id SERIAL PRIMARY KEY,<br>
student_name TEXT,<br>
subject_id INT,<br>

);

| student_id | student_name   | subject_id |
| ---------- | -------------- | ---------- |
| 1          | John Doe       | 1          |
| 2          | Salam Hosain   | 2          |
| 3          | Carolina Shnel | 3          |
| 4          | Salma Banu     | 1          |
| 5          | Jamila Khatun  | 1          |

## Foreign Key

<p>এখানে স্টুডেন্ট আইডি কলাম কে প্রাইমারি কি হিসাবে ব্যাবহার করা হয়েছে </p>

CREATE TABLE students (<br>
course_id SERIAL PRIMARY KEY,<br>
course_name TEXT,<br>
subject_id INT, <br>
subject_id REFERENCES subjects(subject_id)<br>
);

CREATE TABLE subjects (<br>
subject_id SERIAL PRIMARY KEY,<br>
subject_name TEXT,<br>
teacher_id INT ,<br>
teacher_id REFERENCES teachers(teacher_id)<br>
)

## Student Table

| student_id | student_name   | subject_id |
| ---------- | -------------- | ---------- |
| 1          | John Doe       | 1          |
| 2          | Salam Hosain   | 2          |
| 3          | Carolina Shnel | 3          |
| 4          | Salma Banu     | 1          |
| 5          | Jamila Khatun  | 1          |

## Subject Table

| subject_id | subject_name | teacher_id |
| ---------- | ------------ | ---------- |
| 1          | Bangla       | 1          |
| 2          | Math         | 2          |
| 3          | English      | 3          |
| 4          | ICT          | 4          |
| 5          | Physics      | 5          |

<p>আমরা যদি টেবিল দুইটি ভালোভাবে দেখি তবে দেখবো যে, স্টুডেন্ট টেবিলে সাব্জেক্ট টেবিলের প্রাইমারি কি কে রেজারেন্স করা হয়েছে। যা ফরেন কি হিসাবে পরিচিত </p>

# 3. What is the difference between the VARCHAR and CHAR data types?

<p>
দুইটি টেক্সট টাইপের ডাটা সংরক্ষণের জন্য ব্যবহার করা হয়। তবুও দুইটি টাইপের ডাটা সংরক্ষণের ধরণ দুই রকম এবং পারফর্মেন্সের ভিন্যতা রয়েছে।</p>

-- CHAR(5) হলে:
INSERT INTO user (code) VALUES ('A');
-- এটা সংরক্ষণ হবে: 'A ' (পিছনে ৪টা স্পেস সহ)

-- VARCHAR(5) হলে:
INSERT INTO user (code) VALUES ('A');
-- এটা সংরক্ষণ হবে: 'A' (শুধু A)

 <p>সেই ভিন্যতা গুলো নিচে টেবিলের মাধ্যমে তুলে ধরা হইলো। </p>

## CHAR বনাম VARCHAR

| `CHAR(n)` (Fixed-length)                          | `VARCHAR(n)` (Variable-length)                   |
| ------------------------------------------------- | ------------------------------------------------ |
| নির্দিষ্ট দৈর্ঘ্য — সবসময় `n` ক্যারেক্টার রাখে    | পরিবর্তনশীল দৈর্ঘ্য — যতটুকু লাগে ততটুকুই রাখে   |
| ছোট হলে ফাঁকা জায়গা (spaces) দিয়ে পূরণ করে        | শুধু প্রয়োজনীয় ক্যারেক্টার রাখে + extra 1-2 byte |
| একটু দ্রুত কাজ করে কারণ সাইজ ফিক্সড               | একটু ধীরে, কারণ সাইজ প্রতিবার গুনে নিতে হয়       |
| যখন ডেটা সবসময় একই দৈর্ঘ্যের হয় (যেমন: PIN, Code) | যখন ডেটার দৈর্ঘ্য ভিন্ন হয় (যেমন: নাম, ঠিকানা)   |
| অকারণে বেশি জায়গা নেয়                             | জায়গা কম খরচ করে                                 |

# 4. What are the LIMIT and OFFSET clauses used for?

# 5. How can you calculate aggregate functions like COUNT(), SUM(), and AVG() in PostgreSQL?
