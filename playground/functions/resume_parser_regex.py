import re
import nltk
import spacy
NAME_REG = re.compile(r'[A-Za-z]{2,25}( [A-Za-z]{2,25})?')
PHONE_REG = re.compile(r'[\+\(]?[1-9][0-9 .\-\(\)]{8,}[0-9]')
EMAIL_REG = re.compile(r'[a-z0-9\.\-+_]+@[a-z0-9\.\-+_]+\.[a-z]+')

nltk.download('stopwords')
nltk.download('punkt')
nltk.download('averaged_perceptron_tagger')
nltk.download('maxent_ne_chunker')
nltk.download('words')

nlp = spacy.load("en_core_web_sm")
# you may read the database from a csv file or some other database
SKILLS_DB = [
    'Linux',
    'Machine Learning',
    'Data Science',
    'Python',
    'Wordpress',
    'Java',
    'Node.js',
    'Git',
    'Database Management',
    'Serverside Frameworks',
    'Version Control',
    'Web Security',
    'Cloud Computing',
    'Agile Development', 
    'SQL',
    'RESTful APIs',
    'Web Security',
    'Performance Optimization', 
    'Debugging and Troubleshooting',
    'MS Office',
    'MS Power Point',
    'Customer Support',
    'Excel',
    'php',
    'PHP',
    'Team Collaboration',
    'Project Management',
    'Communication Skills',
    'Problem-Solving',
    'Team collaboration',
    'MS Excel',
    'Data Analysis',
    'SonarQube',
    'AWS resources',
    'SQS',
    'EC2',
    'DevOps',
    'CI/CD',
    'Oracle',
    'GitLab',
    'Jenkins',
    'Elastic Kubernetes Service', 
    'Docker', 
    'Kubernetes', 
    'Helmcharts',
    'Terraform',
    'JAVA',
    'CloudFormation',
    'AWS Code Pipeline',
    'ArgoCD and Nexus3',
    'ELK', 
    'Nagios', 
    'AWS (Cloudwatch,SNS,SES)',
    'AWS Cloud', 
    'Azure Cloud'
]

RESERVED_WORDS = [
    'school',
    'college',
    'univers',
    'academy',
    'faculty',
    'institute',
    'faculdades',
    'Schola',
    'schule',
    'lise',
    'lyceum',
    'lycee',
    'polytechnic',
    'kolej',
    'ünivers',
    'okul',
    'education',
    # 'university',    
    # 'bachelor',
    'computer science',
    'bsc',
    'it',
    'ssc',
    'hsc',
    'electrical engineering'
]

EDUCATION_DB = [
    "mumbai university",
    "bachelor in computer science",
    "bachelor of technology in electrical engineering",
    "hsc",
    "ssc",
    'be',
    "bsc",
    "graducation",
    "post graducation",
    "bms",
    "b.com",
    'bcom (Honours)'
    'bcom accounting and taxation',
    'bcom statistics',
    'bcom in management accounting & international finance',
    'bcom in accounting',
    'bcom applied economics',
    'bcom banking & finance',
    'b.ed',
    'b.a',
    'ba',
    'bcom llb',
    'llb',
    'bcom marketing',
    'bcom accounting and finance',
    'bcom banking and finance',
    'bcom economics',
    'bcom applied Economics',
    'bcom accountancy',
    'bcom finance',
    'bcom banking management',
    'bcom banking and insurance',
    'bcom insurance Management',
    'bcom tourism and travel management',
    'secondary school certificate',
    'higher secondary certificate',
    'bachelor of science',
    'bachelor of science (computer science)',
    'bsc in agriculture business management',
    'hsc in science'
]

def extract_name(resume_text):
    name = re.findall(NAME_REG, resume_text) 
    if name:
        full_name = ''.join(name[0])
 
        if resume_text.find(full_name) >= 0 and len(full_name) <3:
            return full_name
    return None
def extract_phone_number(resume_text):
    phone = re.findall(PHONE_REG, resume_text)
    if phone:
        number = ''.join(phone[0])
 
        if resume_text.find(number) >= 0 and len(number) <16:
            return number
    return None

def extract_emails(resume_text):
    return re.findall(EMAIL_REG, resume_text)

def extract_skills_old(input_text):
    # input_text = input_text.replace('\t', ' ')
    stop_words = set(nltk.corpus.stopwords.words('english'))
    word_tokens = nltk.tokenize.word_tokenize(input_text)    
    # remove the stop words
    filtered_tokens = [w for w in word_tokens if w not in stop_words]
 
    # remove the punctuation
    filtered_tokens = [w for w in word_tokens if w.isalpha()]
 
    # generate bigrams and trigrams (such as artificial intelligence)
    bigrams_trigrams = list(map(' '.join, nltk.everygrams(filtered_tokens, 2, 3)))
 
    # we create a set to keep the results in.
    found_skills = set()
    # print('---------filtered_tokens-------')
    # print(filtered_tokens)
    # print('---------filtered_tokens-------')
    # we search for each token in our skills database
    for token in filtered_tokens:
        if token.lower() in SKILLS_DB:
            found_skills.add(token)
 
    # print('-----ngram----')
    # print(bigrams_trigrams)
    # print('--------ngram------')
    # we search for each bigram and trigram in our skills database
    for ngram in bigrams_trigrams:
        if ngram.lower() in SKILLS_DB:
            found_skills.add(ngram)
 
    return convert_skills(remove_duplicates(found_skills))

def extract_skills(text):
    # nlp = spacy.load("en_core_web_sm")
    doc = nlp(text)
    extracted_skills = [skill for skill in SKILLS_DB if skill in text]
    return extracted_skills

def extract_education_old(input_text):
    organizations = []
 
    # first get all the organization names using nltk
    for sent in nltk.sent_tokenize(input_text):
        for chunk in nltk.ne_chunk(nltk.pos_tag(nltk.word_tokenize(sent))):
            # print(chunk)
            if hasattr(chunk, 'label'):
                organizations.append(' '.join(c[0] for c in chunk.leaves()))
 
    # we search for each bigram and trigram for reserved words
    # (college, university etc...)
    education = []
    for org in organizations:
        for word in RESERVED_WORDS:
            if org.lower().find(word) > 0:
                education.append(org)
    return remove_duplicates(education)

def extract_education(text):
    doc = nlp(text)
    
    # Define patterns for education-related entities
    education_patterns = [
        {"label": "DEGREE", "pattern": [{"LOWER": {"in": ["bachelor", "master", "phd", "doctorate", "degree"]}}]},
        {"label": "INSTITUTION", "pattern": [{"ENT_TYPE": "ORG"}]},
        {"label": "DATE", "pattern": [{"ENT_TYPE": "DATE"}]}
    ]
    
    # Create a matcher
    from spacy.matcher import Matcher
    matcher = Matcher(nlp.vocab)
    
    # Add patterns to the matcher
    for pattern in education_patterns:
        matcher.add(pattern["label"], [pattern["pattern"]])
    
    matches = matcher(doc)
    
    education_info = {
        "Degrees": [],
        "Institutions": [],
        "Dates": []
    }
    
    for match_id, start, end in matches:
        label = nlp.vocab.strings[match_id]
        span = doc[start:end]
        
        if label == "DEGREE":
            education_info["Degrees"].append(span.text)
        elif label == "INSTITUTION":
            education_info["Institutions"].append(span.text)
        elif label == "DATE":
            education_info["Dates"].append(span.text)
    
    return education_info

def convert_text_to_array(text):
    # Initialize an empty dictionary to hold the structured data
    data = {}
    
    # Define patterns for each section
    patterns = {
        'summary': re.compile(r"SUMMARY\n\n(.*?)(?=\n\n|$)", re.DOTALL),
        'education': re.compile(r"EDUCATION\n\n(.*?)(?=\n\n|$)", re.DOTALL),
        'experience': re.compile(r"EXPERIENCE\n\n(.*?)(?=\n\n|$)", re.DOTALL),
        'contact': re.compile(r"CONTACT\n\n(.*?)(?=\n\n|$)", re.DOTALL),
        'skills': re.compile(r"SKILLS\n\n(.*?)(?=\n\n|$)", re.DOTALL),
        'languages': re.compile(r"LANGUAGES\n\n(.*?)(?=\n\n|$)", re.DOTALL),
    }
    
    # Extract data using regex patterns
    for key, pattern in patterns.items():
        match = pattern.search(text)
        if match:
            data[key] = match.group(1).strip().split('\n')
    
    return data

def remove_duplicates(skills):
    seen = set()
    unique_skills = []
    for skill in skills:
        # Normalize the skill for case-insensitive comparison
        normalized_skill = skill.lower()
        if normalized_skill not in seen:
            seen.add(normalized_skill)
            unique_skills.append(skill)
    return unique_skills

def capitalize_words(text):
    # """
    # Capitalize the first letter of each word in the given text, preserving spaces.
    # """
    # Split the text into words
    words = text.split()
    
    # Capitalize the first letter of each word
    capitalized_words = [word.capitalize() for word in words]
    capitalized_words_formated = [fword.replace('And','and') for fword in capitalized_words]
    # Join the words back with spaces
    return ' '.join(capitalized_words_formated)

def convert_skills(skills):
    # """
    # Convert each skill in the list to have proper capitalization, preserving spaces.
    # """
    # Capitalize each skill and return the new list
    return [capitalize_words(skill) for skill in skills]  

def extract_db_education(input_text):
    input_text = input_text.replace('\t', ' ')
