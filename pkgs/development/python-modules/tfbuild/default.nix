{ lib
, buildPythonPackage
, fetchFromGitHub
, pythonOlder
, boto3
, colorlog
, confuse
, gitpython
, jsonpickle
, py_console
, pyyaml
, pyhcl
, requests
, six

# build-system
, setuptools
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
    hash = "118skvn92j8rxbhrzx0dxz1x3m4nvrgqcgcxcwnn0ris3ydf3sar";
  };

  nativeBuildInputs = [
    setuptools
  ];

  propagatedBuildInputs = [
    #boto3
    colorlog
    confuse
    gitpython
    jsonpickle
    py_console
    pyyaml
    pyhcl
    requests
    six
  ];

  pythonImportsCheck = [
    "tfbuild"
  ];

  meta = with lib; {
    description = "Opinionated terraform wrapper";
    homepage = "https://github.com/mpearson117/tfbuild";
    changelog = "https://github.com/mpearson117/tfbuild/releases/tag/v${version}";
    license = with licenses; [ asl20 ];
    maintainers = with maintainers; [ acelinkio ];
  };
}
