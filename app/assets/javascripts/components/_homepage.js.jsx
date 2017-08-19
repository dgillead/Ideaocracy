let HomePage = React.createClass({
  render() {
    return (
      <div className="jumbotron">
        <h1 className="text-center" id="title">Idea<em>Ocracy</em></h1>
        <hr />
        <h2 className="text-center" id="tagline">Clarify, collaborate and codify ideas into future projects</h2>
        <div className="text-center">
          <button className="btn btn-success intro-buttons">View Ideas</button>
          <button className="btn btn-info intro-buttons">Create Idea</button>
        </div>
      </div>
    )
  }
});
