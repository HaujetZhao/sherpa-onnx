#!/usr/bin/env bash

set -ex

echo "dir: $d"
cd $d
npm install
git status
ls -lh
ls -lh node_modules

# offline asr

wget -q https://github.com/k2-fsa/sherpa-onnx/releases/download/asr-models/sherpa-onnx-nemo-ctc-en-conformer-small.tar.bz2
tar xvf sherpa-onnx-nemo-ctc-en-conformer-small.tar.bz2
rm sherpa-onnx-nemo-ctc-en-conformer-small.tar.bz2
node ./test-offline-nemo-ctc.js
rm -rf sherpa-onnx-nemo-ctc-en-conformer-small

wget -q https://github.com/k2-fsa/sherpa-onnx/releases/download/asr-models/sherpa-onnx-paraformer-zh-2023-03-28.tar.bz2
tar xvf sherpa-onnx-paraformer-zh-2023-03-28.tar.bz2
rm sherpa-onnx-paraformer-zh-2023-03-28.tar.bz2
node ./test-offline-paraformer.js
rm -rf sherpa-onnx-paraformer-zh-2023-03-28

wget -q https://github.com/k2-fsa/sherpa-onnx/releases/download/asr-models/sherpa-onnx-zipformer-en-2023-06-26.tar.bz2
tar xvf sherpa-onnx-zipformer-en-2023-06-26.tar.bz2
rm sherpa-onnx-zipformer-en-2023-06-26.tar.bz2
node ./test-offline-transducer.js
rm -rf sherpa-onnx-zipformer-en-2023-06-26

wget -q https://github.com/k2-fsa/sherpa-onnx/releases/download/asr-models/sherpa-onnx-whisper-tiny.en.tar.bz2
tar xvf sherpa-onnx-whisper-tiny.en.tar.bz2
rm sherpa-onnx-whisper-tiny.en.tar.bz2
node ./test-offline-whisper.js
rm -rf sherpa-onnx-whisper-tiny.en

# online asr
wget -q https://github.com/k2-fsa/sherpa-onnx/releases/download/asr-models/sherpa-onnx-streaming-paraformer-bilingual-zh-en.tar.bz2
tar xvf sherpa-onnx-streaming-paraformer-bilingual-zh-en.tar.bz2
rm sherpa-onnx-streaming-paraformer-bilingual-zh-en.tar.bz2
node ./test-online-paraformer.js
rm -rf sherpa-onnx-streaming-paraformer-bilingual-zh-en

wget -q https://github.com/k2-fsa/sherpa-onnx/releases/download/asr-models/sherpa-onnx-streaming-zipformer-bilingual-zh-en-2023-02-20.tar.bz2
tar xvf sherpa-onnx-streaming-zipformer-bilingual-zh-en-2023-02-20.tar.bz2
rm sherpa-onnx-streaming-zipformer-bilingual-zh-en-2023-02-20.tar.bz2
node ./test-online-transducer.js
rm -rf sherpa-onnx-streaming-zipformer-bilingual-zh-en-2023-02-20

# offline tts
wget -q https://github.com/k2-fsa/sherpa-onnx/releases/download/tts-models/vits-vctk.tar.bz2
tar xvf vits-vctk.tar.bz2
rm vits-vctk.tar.bz2
node ./test-offline-tts-en.js
rm -rf vits-vctk

wget -q https://github.com/k2-fsa/sherpa-onnx/releases/download/tts-models/vits-zh-aishell3.tar.bz2
tar xvf vits-zh-aishell3.tar.bz2
rm vits-zh-aishell3.tar.bz2
node ./test-offline-tts-zh.js
rm -rf vits-zh-aishell3
