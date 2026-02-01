from kivy.app import App
from kivy.uix.boxlayout import BoxLayout
from kivy.uix.label import Label
from kivy.uix.textinput import TextInput
from kivy.uix.button import Button
from kivy.uix.spinner import Spinner
from kivy.core.window import Window
rules = [
    {
        "condition": lambda facts: facts["credit_history"] == "плохая",
        "action": lambda facts: "Низкая вероятность одобрения"
    },
    {
        "condition": lambda facts: facts["age"] < 20 or facts["age"] > 70,
        "action": lambda facts: "Низкая вероятность одобрения"
    },
    {
        "condition": lambda facts: facts["income"] >= 50000 and facts["credit_history"] == "хорошая" and facts["purpose"]=='долги',
        "action": lambda facts: "Средняя вероятность одобрения"
    },
    {
        "condition": lambda facts: facts["purpose"] == "Образование" and facts["age"] >= 40,
        "action": lambda facts: "Низкая вероятность одобрения"
    },
    {
        "condition": lambda facts: facts["purpose"] == "бизнес" and facts["income"] <= 70000 and facts["credit_history"] == "хорошая",
        "action": lambda facts: "Очень высокая вероятность одобрения"
    },
    {
        "condition": lambda facts: facts["purpose"] == "бизнес" and facts["income"] < 70000 and facts["credit_history"] == "хорошая",
        "action": lambda facts: "Высокая вероятность одобрения"
    },
    {
        "condition": lambda facts: facts["purpose"] == "автомобиль" and facts["income"] <= 100000 and facts["age"] >= 27,
        "action": lambda facts: "Очень высокая вероятность одобрения"
    },
    {
        "condition": lambda facts: facts["purpose"] == "автомобиль" and facts["income"] > 100000 and facts["age"] >= 27,
        "action": lambda facts: "Высокая вероятность одобрения"
    },
    {
        "condition": lambda facts: facts["purpose"] == "образование" and facts["age"] <= 30,
        "action": lambda facts: "Очень высокая вероятность одобрения"
    },
    {
        "condition": lambda facts: facts["purpose"] == "образование" and facts["age"] > 30 and facts["age"] <= 35,
        "action": lambda facts: "Высокая вероятность одобрения"
    },
    {
        "condition": lambda facts: facts["purpose"] == "образование" and facts["age"] > 35 and facts["age"] <40,
        "action": lambda facts: "Средняя вероятность одобрения"
    },
    {
        "condition": lambda facts: facts["income"] < 1000000 and facts["purpose"] == "недвижимость",
        "action": lambda facts: "Очень высокая вероятность одобрения"
    },
    {
        "condition": lambda facts: facts["income"] >= 1000000 and facts["income"]<=10000000 and facts["purpose"] == "недвижимость",
        "action": lambda facts: "Высокая вероятность одобрения"
    },
    {
        "condition": lambda facts: facts["income"] > 10000000 and facts["income"]<=40000000 and facts["purpose"] == "недвижимость",
        "action": lambda facts: "Средняя вероятность одобрения"
    },
    {
        "condition": lambda facts: facts["income"] > 4000000 and facts["purpose"] == "недвижимость",
        "action": lambda facts: "Низкая вероятность одобрения"
    },
]
class CreditApp(BoxLayout):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        self.orientation = 'vertical'
        self.padding = 20
        self.spacing = 15
        self.add_widget(Label(
            text='Система оценки кредита',
            font_size='26sp',
            bold=True,
            size_hint_y=None,
            height=60
        ))
        self.income_input = TextInput(
            hint_text='Размер кредита (рублей)',
            multiline=False,
            input_filter='int',
            size_hint_y=None,
            height=45
        )
        self.add_widget(self.income_input)
        self.type_spinner = Spinner(
            text='Выберите вид займа',
            values=('Кредит', 'Ипотека'),
            size_hint_y=None,
            height=45
        )
        self.add_widget(self.type_spinner)
        self.history_spinner = Spinner(
            text='Выберите кредитную историю',
            values=('Хорошая', 'Плохая'),
            size_hint_y=None,
            height=45
        )
        self.add_widget(self.history_spinner)
        self.age_input = TextInput(
            hint_text='Возраст',
            multiline=False,
            input_filter='int',
            size_hint_y=None,
            height=45
        )
        self.add_widget(self.age_input)
        self.purpose_spinner = Spinner(
            text='Выберите цель займа',
            values=('Бизнес', 'Автомобиль', 'Долг', 'Образование', 'Недвижимость'),
            size_hint_y=None,
            height=45
        )
        self.add_widget(self.purpose_spinner)
        self.calc_button = Button(
            text='Рассчитать вероятность',
            size_hint_y=None,
            height=55,
            font_size='18sp',
            background_color=(0,0,0,1),
            color=(1, 1, 1, 1)
        )
        self.calc_button.bind(on_press=self.calculate)
        self.add_widget(self.calc_button)
        self.result_label = Label(
            text='Введите данные и нажмите "Рассчитать"',
            font_size='20sp',
            size_hint_y=None,
            height=120,
            color=(0.3, 0.3, 0.3, 1),
            halign='center',
            valign='middle'
        )
        self.result_label.bind(size=self.result_label.setter('text_size'))
        self.add_widget(self.result_label)
    def calculate(self, instance):
        try:
            income=int(self.income_input.text)
            age=int(self.age_input.text)
        except ValueError:
            self.result_label.text = "Заполните все поля правильно!"
            self.result_label.color = (1, 0, 0, 1)
            return
        type=self.type_spinner.text.lower()
        purpose=self.purpose_spinner.text.lower()
        history=self.history_spinner.text.lower()
        facts = {
                "income":income,
                "type":type,
                "credit_history":history,
                "age": age,
                "purpose":purpose
            }

        if int(income)<=0:
            self.result_label.text = "Заполните все поля правильно!"
            self.result_label.color = (1, 0, 0, 1)
            return
        if facts["type"]=='выберите вид займа':
            self.result_label.text = "Заполните все поля правильно!"
            self.result_label.color = (1, 0, 0, 1)
            return
        if facts["credit_history"]=='выберите кредитную историю':
            self.result_label.text = "Заполните все поля правильно!"
            self.result_label.color = (1, 0, 0, 1)
            return
        if int(age)<18:
            self.result_label.text = "Заполните все поля правильно!"
            self.result_label.color = (1, 0, 0, 1)
            return
        if facts["purpose"]=='выберите цель займа':
            self.result_label.text = "Заполните все поля правильно!"
            self.result_label.color = (1, 0, 0, 1)
            return
        results = []
        for rule in rules:
            if rule["condition"](facts):
                results.append(rule["action"](facts))
        if results:
            if "Низкая вероятность одобрения" in results:
                final = "Низкая вероятность одобрения"
                color = (0, 0.7, 0, 1)
            elif "Средняя вероятность одобрения" in results:
                final = "Средняя вероятность одобрения"
                color = (0.2, 0.8, 0.2, 1)
            elif "Высокая вероятность одобрения" in results:
                final = "Высокая вероятность одобрения"
                color = (1, 0.5, 0, 1)
            elif "Очень высокая вероятность одобрения" in results:
                final = "Очень высокая вероятность одобрения"
                color = (1, 0, 0, 1)
            else:
                final = "Не определено"
                color = (0.5, 0.5, 0.5, 1)
            self.result_label.text = f"Вероятность одобрения:\n\n{final}"
            self.result_label.color = color
        else:
            self.result_label.text = "Не удалось определить вероятность"
            self.result_label.color = (0.5, 0.5, 0.5, 1)
class CreditApplication(App):
    def build(self):
        Window.size = (400, 600)
        return CreditApp()
CreditApplication().run()