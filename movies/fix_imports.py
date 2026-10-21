# Remplace, dans tout le dossier lib/, les anciens imports des dossiers
# data/ et network/ (et de firebase_auth / google_sign_in) par l'import
# unique du package : import 'package:movie_data/movie_data.dart';
# Utilisation (à la racine du projet movies) : python3 fix_imports.py
import pathlib
import re

NEW = "import 'package:movie_data/movie_data.dart';"
OLD = re.compile(
    r"^import 'package:(movies/(data|network)/[^']*"
    r"|firebase_auth/firebase_auth\.dart"
    r"|google_sign_in/google_sign_in\.dart)';\s*$"
)

changed = 0
for path in pathlib.Path('lib').rglob('*.dart'):
    if path.name.endswith(('.g.dart', '.freezed.dart', '.gr.dart')):
        continue
    lines = path.read_text().split('\n')
    out = []
    replaced = False
    for line in lines:
        if OLD.match(line):
            if not replaced and NEW not in lines:
                out.append(NEW)
            replaced = True
            continue
        out.append(line)
    if replaced:
        path.write_text('\n'.join(out))
        changed += 1
        print('modifié :', path)
print(changed, 'fichier(s) modifié(s)')
