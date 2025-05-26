# 1. What is PostgreSQL?

<p>PostgreSQL একটি ওপেন সোর্স শক্তিশালী অব্জেক্ট রিলেশনাল ডাটাবেস মানেজমেন্ট সিস্টেম। যাতে  উন্নত ফিচার, স্টাবিলিটি ও আদর্শ SQL ডাটাবেস ম্যানেজমেন্ট সিস্টেম কে অনুসরন করে। এটিকে সংক্ষিপ্ত ভাবে Postgress নামেও বলা হয়। তাছাড়া এর উন্নত ডাটা টাইপ, মাল্টি ইউজার এক্সেস, দ্রুততা, ডাটা নিরাপত্তা, ক্রস-প্লাটফর্ম ডাটা রিডিং সহ আরো উন্নত ফিচারের জন্য অনেক জনপ্রিয় একটি ডাটাবেস সিস্টেম এ পরিণত হয়ে উঠেছে। </p>

# 2. Explain the Primary Key and Foreign Key concepts in PostgreSQL.

<p>
ডাটাবেস সিস্টেমে কি হচ্ছে একটি কলাম অথবা একাধিক কলামের সমষ্টি, যা একটি নির্দিষ্ট রো কে চিহ্নিত করে। যার মাধ্যমে একটি ডাটাবেসের অসংখ্য রেকর্ড থেকে নির্দিষ্ট রেকর্ডকে খুজে পাওয়া যায়। 
</p>

## Primary Key

<p>যখন কোন ডাটাবেস সিস্টেমের টেবিলের কোন কলাম কে ইউনিক আইডেন্টিফায়ার হিসাবে ব্যবহার করা হয় তখন সেটা কে প্রাথমিক কি বলে।  </p>

| student_id | student_name   | subject_id |
| ---------- | -------------- | ---------- |
| 1          | John Doe       | 1          |
| 2          | Salam Hosain   | 2          |
| 3          | Carolina Shnel | 3          |
| 4          | Salma Banu     | 1          |
| 5          | Jamila Khatun  | 1          |

## Foreign Key

<p>এখানে স্টুডেন্ট আইডি কলাম কে প্রাইমারি কি হিসাবে ব্যাবহার করা হয়েছে </p>

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

## Primary Key

<p>যখন কোন ডাটাবেস সিস্টেমের একটি টেবিলে অন্য কোন টেবিলের প্রাইমারি কি কে ব্যবহার করা হয় তখন সেটিকে ফরেন কি বলা হয়।</p>

# 4. What is the difference between the VARCHAR and CHAR data types?

# 5. What are the LIMIT and OFFSET clauses used for?

# 6. How can you calculate aggregate functions like COUNT(), SUM(), and AVG() in PostgreSQL?
