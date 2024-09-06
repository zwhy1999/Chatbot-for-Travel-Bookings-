from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.model_selection import train_test_split
from sklearn.svm import SVC
from sklearn.metrics import classification_report
from sklearn.pipeline import Pipeline
import joblib

# 数据集
data = [
    ("book a flight", "flight ticket"),
    ("please help me to book a flight ticket", "flight ticket"),
    ("flight ticket", "flight ticket"),
    ("I want to book a flight ticket", "flight ticket"),
    ("Can you book a flight for me?", "flight ticket"),
    ("I would like to book a flight ticket", "flight ticket"),
    ("Could you help me book a plane ticket", "flight ticket"),
    ("How can I purchase a plane ticket online", "flight ticket"),
    ("I want to buy a flight ticket", "flight ticket"),
    ("Do you have any available flights", "flight ticket"),
    ("I need to reserve a flight ticket", "flight ticket"),
    ("Find me the cheapest flight", "flight ticket"),

    ("Show me my order history", "order history"),
    ("I want to see my order history", "order history"),
    ("I want you to show me the order history", "order history"),
    ("order history", "order history"),
    ("What is my booking history?", "order history"),
    ("I would like to check my order history", "order history"),
    ("Can I see my previous orders", "order history"),
    ("Could you help me find my order history", "order history"),
    ("I want to view my recent orders", "order history"),
    ("Please show my last booking details", "order history"),
    ("Can I see the history of my orders", "order history"),
    ("Can you show me what I ordered last time", "order history"),


    ("I would like to book a train ticket", "train ticket"),
    ("Could you help me book a train ticket","train ticket"),
    ("How can I purchase a train ticket online", "train ticket"),
    ("I need a train ticket", "train ticket"),
    ("train ticket", "train ticket"),
    ("need the train ticket", "train ticket"),
    ("need to book a train ticket", "train ticket"),
    ("Please find a train ticket for tomorrow", "train ticket"),
    ("How can I book a train ticket", "train ticket"),
    ("I need to buy a train ticket", "train ticket"),
    ("Please help me find a train ticket for tomorrow", "train ticket"),
    ("Are there any train tickets available to Chicago", "train ticket"),

    ("What is the weather today?", "other"),
    ("Tell me a joke.", "other"),
    ("Play some music.", "other"),
    ("How are you?", "other"),
    ("Who won the game last night?", "other"),
    ("Open the door", "other"),
    ("Turn on the lights", "other"),
    ("Set an alarm for tomorrow", "other"),
    ("Remind me to call mom", "other"),
    ("What time is it?", "other"),
    ("asdasd", "other"), 
    ("Tell me the latest news.", "other"), 
]


texts, labels = zip(*data)


pipeline = Pipeline([
    ('tfidf', TfidfVectorizer(ngram_range=(1, 2))),
    ('classifier', SVC(kernel='linear', probability=True))  # 设置probability=True
])


X_train, X_test, y_train, y_test = train_test_split(texts, labels, test_size=0.2, random_state=42)


pipeline.fit(X_train, y_train)


y_pred = pipeline.predict(X_test)
print("Classification Report:\n", classification_report(y_test, y_pred))


joblib.dump(pipeline, 'intent_pipeline.pkl')
