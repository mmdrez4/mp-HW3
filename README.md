# mp-HW3
## swift code for handling todo lists<br />
team members:

    Mohammadreza Daviran - id:98101566
    
    Kahbod Aeini - id:98101209

<p dir="rtl">
ابتدا لیست دستورات به صورت زیر نمایش داده میشود: <br />
</p>

choose the Menu: <br />
1.add new todo <br />
2.show Todo List <br />
3.change <br />
4.delete <br />
5.sort <br />
6.create a category <br />
7.add todos to the categories <br />
8.show category <br />
9.exit<br />


<p dir="rtl">
بعد از اجرای هر دستور به طور کامل نیز لیست بالا برای راهنمایی باز هم print می شود تا دستور مورد نظر را به راحتی انتخاب کنید. لازم به ذکر است در کل کد برای انتخاب هر دستور فقط و فقط عدد مربوطه را وارد می کنیم. برای مثال برای دستور add new todo تنها عدد 1 را وارد می کنیم. در این کد فرض شده که title ها unique هستند و دو todo نمیتوانند با title یکسان وجود داشته باشند.
</p>

<br />
<p dir="rtl">
اضافه کردن todo به این صورت است که پس از وارد کردن عدد 1 به ترتیب title و contentو priority از ما پرسیده می شود و priority حتما باید int باشد در غیر این صورت todo جدید ایجاد نمی شود و دوباره باید از اول دستور 1 را بزنیم و موارد مورد نیاز را وارد کنیم. پس از ساخته شدن todo پیغام متناسب با آن چاپ می شود.
</p>

<br />
<p dir="rtl">
برای نشان دادن لیست todo ها تنها کافیست عدد 2 را وارد کنیم که پس از آن لیست به نمایش در میاید(براساس زمان اضافه شدن)
</p>

<br />
<p dir="rtl">
برای تغییر title و یا content و همچنین priority نیاز است عدد 3 را وارد کنیم سپس پارامتر مورد نظرمان را که میخواهیم تغییر دهیم باز هم تنها با وارد کردن عدد که اینجا 1 نمایانگر title است و 2 نمایانگر content می باشد و همچنین 3 که نشان دهنده ی priority است مشخص میکنیم سپس مقدار جدید پارامتر مورد نظر از ما خواسته می شود که یاداوری می شود priority باید integer باشد. پس از این مراحل پیغام موفقیت آمیز بودن یا نبودن این عمل چاپ می شود.
</p>

<br />
<p dir="rtl">
برای delete کردن و حذف یک آیتم todo شماره 4 را وارد کرده سپس تنها کافیست title تودو خود را وارد کنیم تا در صورت وجود آن را حذف کنیم.
</p>

<br />
<p dir="rtl">
برای sort کردن باید عدد 5 را وارد کنیم سپس دستور زیر به نمایش در میاید:
</p>
enter the parameter you want to be sorted by: 1.time 2.title 3.priority: <br />
<p dir="rtl">
کافی است یکی از اعداد ۱ یا ۲ یا ۳ را وارد کنیم و پس از وارد کردن عدد مورد نظر دستور زیر پس از آن به نمایش در میاید: 
</p>
enter the method you want to sort: 1.ascending 2.descending: <br />
<p dir="rtl">
یکی از اعداد ۱ یا ۲ را وارد میکنیم و پس از آن لیست ما مرتب شده به صورت مورد نظر ما نمایش داده می شود.
</p>

<br />
<p dir="rtl">
برای ایجاد یک دسته در صورتی که اسم دسته ها یکتا باشد باید عدد 6 را وارد کنیم. سپس اسم دسته از ما خواسته می شود، اگر اسم دسته تکراری نبود آن را به دسته هایمان اضافه می کنیم و پس از اینکار پیغام مناسب نمایش داده می شود.
</p>

<br />
<p dir="rtl">
برای امکان اضافه کردن یک یا چند آیتم todo به یک دسته ابتدا عدد 7 را وارد می کنیم سپس اسم دسته ای که میخواهیم را وارد می کنیم و سپس title تودو ها و content آن ها نمایش داده می شود. حال title تودو مورد نظر خود را نوشته و با این کار این todo به category مورد نظر اضافه می شود. اگر چند todo را بخواهیم به category مورد نظر اضافه کنیم باید title آن ها را با یک فاصله از یکدیگر وارد کنیم. به مثال زیر دقت کنید:
</p>
7<br />
enter the name of the category: <br />
category1<br />
titles and contents of the Todos:<br />
1. todo1 content1<br />
2. todo2 content2<br />
enter the titles you want to add (seperated by a white space): <br />
todo1 todo2<br />
have been added successfully! <br />
<br />

<br />
<p dir="rtl">
برای مشاهده ی todo های متعلق به یک category خاص باید ابتدا عدد 8 را وارد کنیم سپس نام category خواسته می شود و پس از وارد کردن نام آن در صورتی که دسته ای با این نام موجود باشد todo های زیرمجموعه آن به نمایش در می آیند.  به مثال زیر دقت کنید:
</p>
8<br />
enter the name of the category: <br />
category1<br />
category1: <br />
    1. todo1<br />
    2. todo2<br />

<p dir="rtl">
با وارد کردن عدد 9 برنامه ما پایان می یابد!
</p>
