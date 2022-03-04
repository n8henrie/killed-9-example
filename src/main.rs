use rss::Channel;

async fn get_channel() -> anyhow::Result<Channel> {
    let ua = "killed-9-example";
    let client = reqwest::Client::builder().user_agent(ua).build()?;
    let content = client
        .get("https://n8henrie.com/feed.xml")
        .send()
        .await?
        .bytes()
        .await?;
    let channel = Channel::read_from(&content[..])?;
    Ok(channel)
}

#[tokio::main]
async fn main() -> anyhow::Result<()> {
    let result = get_channel().await?;
    for item in result.items() {
        for cat in &item.categories {
            println!("{:?}", cat)
        }
    }
    Ok(())
}
