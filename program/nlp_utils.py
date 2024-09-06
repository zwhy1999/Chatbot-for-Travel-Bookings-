# nlp_utils.py

import joblib


pipeline = joblib.load('intent_pipeline.pkl')

def check_intent(text):
    
    if not isinstance(text, str):
        return 'other'
    
    
    if text.strip().lower() == 'exit':
        return 'exit'

    
    text = text.lower().strip()  

    
    probabilities = pipeline.predict_proba([text])  
    max_prob = max(probabilities[0])
    intent = pipeline.predict([text])[0]  

    
    if max_prob < 0.5:
        return 'other'
    
    
    known_intents = ['flight ticket', 'train ticket', 'order history']
    if intent not in known_intents:
        return 'other'
    return intent
