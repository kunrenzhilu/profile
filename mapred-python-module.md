this will do the trick
```python
import sys
sys.path.append('./')
```

```
├── app
│   ├── bert.py
│   ├── __init__.py
│   └── tokenization.py
└── reducer.py
```

```
import sys                                                                                                                                                                                                
sys.path.append('./')
from app.bert import DatasetManager

if __name__=="__main__":
    print(DatasetManager)
```
