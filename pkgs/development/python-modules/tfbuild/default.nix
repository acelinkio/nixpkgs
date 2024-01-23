{ lib
, buildPythonPackage
, fetchFromGitHub
, pythonOlder

# build-system
, setuptools

# tests
, pytestCheckHook
}:

buildPythonPackage rec {
  pname = "tfbuild";
  version = "1.3.1";
  pyproject = true;

  disabled = pythonOlder "3.6";

  src = fetchFromGitHub {
    owner = "mpearson117";
    repo = pname;
    rev = "refs/tags/v${version}";
    hash = "";
  };

  nativeBuildInputs = [
    setuptools
  ];

  propagatedBuildInputs = [
    boto3
    colorlog
    confuse
    GitPython
    jsonpickle
    py_console
    PyYAML
    pyhcl
    requests
    six
  ];

  nativeCheckInputs = [
    pytestCheckHook
  ];

  pythonImportsCheck = [
    "tfbuild"
  ];

  meta = with lib; {
    description = "Extensible memoizing collections and decorators";
    homepage = "https://github.com/mpearson117/tfbuild";
    changelog = "https://github.com/mpearson117/tfbuild/releases/tag/v${version}";
    license = with licenses; [ asl20 ];
    maintainers = with maintainers; [ acelinkio ];
  };
}
