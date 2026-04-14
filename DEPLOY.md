# دليل رفع المشروع على Dokploy

## المتطلبات
- سيرفر عنده Dokploy مثبت
- دومين: `pandastore.bramjlive.com`
- Vendure backend شغال (محلي أو على سيرفر)

---

## الخطوة 1 — ارفع الكود على GitHub

1. اعمل Repository جديد على GitHub (ممكن يكون Private)
2. فك الـ ZIP اللي نزّلته
3. افتح Terminal جوه الفولدر وشغّل:

```bash
git init
git add .
git commit -m "init: arabic storefront"
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO.git
git push -u origin main
```

---

## الخطوة 2 — افتح Dokploy وعمل Application جديد

1. ادخل على Dokploy Dashboard
2. اضغط **"New Project"** → اديه اسم مثلاً `pandastore`
3. جوه المشروع اضغط **"New Service"** → اختار **"Application"**

---

## الخطوة 3 — اربط الـ Repository

في إعدادات الـ Application:

| الحقل | القيمة |
|---|---|
| **Provider** | GitHub |
| **Repository** | اختار الـ repo اللي رفعته |
| **Branch** | `main` |
| **Build Type** | `Dockerfile` |

اضغط **Save**

---

## الخطوة 4 — Environment Variables

اضغط على تاب **"Environment"** وأضف المتغيرات دي:

```env
NODE_ENV=production
VENDURE_API_URL=https://readonlydemo.vendure.io/shop-api
SESSION_SECRET=CHANGE_THIS_TO_RANDOM_SECRET_STRING
```

> **مهم:** غيّر `SESSION_SECRET` لأي string عشوائي طويل مثلاً: `my-super-secret-key-2024-panda`

> **ملحوظة:** لو عندك Vendure instance خاص بيك، حط رابطه بدل الـ demo

---

## الخطوة 5 — إعداد الـ Domain

1. اضغط تاب **"Domains"**
2. اضغط **"Add Domain"**
3. أدخل:

| الحقل | القيمة |
|---|---|
| **Host** | `pandastore.bramjlive.com` |
| **Port** | `3000` |
| **HTTPS** | شغّل (Let's Encrypt) |

4. اضغط **Save**

---

## الخطوة 6 — اعمل Deploy

1. اضغط **"Deploy"** أو **"Redeploy"**
2. انتظر تقريباً 2-3 دقايق للـ build
3. افتح `https://pandastore.bramjlive.com` ✅

---

## DNS Settings

في إعدادات الدومين بتاعك، أضف:

```
Type: A
Name: pandastore
Value: IP_ADDRESS_OF_YOUR_SERVER
TTL: 300
```

---

## لو حصل مشكلة — Logs

في Dokploy اضغط تاب **"Logs"** عشان تشوف الـ error.

**أشهر المشاكل:**

| المشكلة | الحل |
|---|---|
| `Cannot connect to Vendure` | تأكد إن `VENDURE_API_URL` صح |
| `Port already in use` | غيّر الـ Port في الـ Domain settings |
| `Build failed` | اتأكد إن Node version 20 |

---

## ملاحظة على `.env`

لو عندك Stripe أو Braintree، أضف:

```env
STRIPE_PUBLISHABLE_KEY=pk_live_...
```
